from flask import Flask, render_template, request, jsonify, redirect, url_for, make_response, session
from datetime import datetime
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'buenastardes'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'administradorFlask'
app.config['MYSQL_PASSWORD'] = 'queondaprofe'
app.config['MYSQL_DB'] = 'elregio'

mysql = MySQL(app)

#template inicial
@app.route('/')
def index():
        return render_template('index.html')


#Template acerca de nosotros
@app.route('/about')
def about():
        return render_template('about.html')

#Pago del paciente 
@app.route('/pagos', methods=['GET', 'POST'])
def pagos():
    #verifica que el usuario haya hecho login
    id_paciente = session.get('id_paciente')
    if id_paciente is None:
        return redirect(url_for('inicioSesion'))

    cur = mysql.connection.cursor()

    #realiza el insert de los datos de la tarjeta a la tabla 
    if request.method == 'POST':
        nombreTitular = request.form.get('cardname')
        numTarjeta = request.form.get('cardnumber')
        fechaExp = datetime.datetime.strptime(request.form.get('expmonth'), "%m/%y")  # Convertir el string de fecha a un objeto datetime
        CVV = request.form.get('cvv')

        # Aquí puedes insertar los datos del formulario en tu base de datos
        cur.execute('''
            INSERT INTO PAGO (id_paciente, nombreTitular, numTarjeta, fechaExp, CVV)
            VALUES (%s, %s, %s, %s, %s)
        ''', (id_paciente, nombreTitular, numTarjeta, fechaExp, CVV))

        mysql.connection.commit()  # No olvides hacer commit de los cambios a la base de datos


    # Obteniendo los tratamientos para el paciente
    cur.execute("SELECT id_tratamiento, nombre, descripcion, total FROM TRATAMIENTO WHERE id_paciente=%s", [id_paciente])
    tratamientos = cur.fetchall()
    print(tratamientos)  # Añade esta línea

    # Obteniendo los resultados para el paciente
    cur.execute("SELECT id_resultado, nombreDelExamen, resultadoExamen, total FROM RESULTADOS_EXAMEN WHERE id_paciente=%s", [id_paciente])
    resultados = cur.fetchall()

    cur.close()

    return render_template('pagos.html', tratamientos=tratamientos, resultados=resultados)

"""
@app.route('/cita', methods=['POST'])
def crearCita():
    id_paciente = session.get('id_paciente')
    if id_paciente is None:
        return redirect(url_for('inicioSesion'))

    fechaHoraInicio = request.form['fechaHoraInicio']
    fechaHoraFin = request.form['fechaHoraFin']
    descripcion = descripcion.form['descripcion']

    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO CITAS(id_paciente, fechaHoraInicio, fechaHoraFin,descripcion) VALUES(%s, %s, %s, %s)", (id_paciente, fechaHoraInicio, fechaHoraFin, descripcion))
    mysql.connection.commit()
    cur.close()

    return redirect(url_for('index'))
"""
#Pagina de inicio de sesion, verifica que los datos ingresados por el usuario sean correctos hacia la base de datos
@app.route('/inicioSesion', methods=['GET', 'POST'])
def inicioSesion():
    if request.method == 'POST':
        correo = request.form['correo']
        contrasena = request.form['contrasena']

        if not correo or not contrasena:
            return render_template('inicioSesion.html', error='Por favor ingrese correo y contraseña.')

        #Llama a los procedimientos almacenados para obtener el correo del paciente
        cur = mysql.connection.cursor()
        cur.callproc('GetPacienteCorreo', [correo])
        usuario = cur.fetchone()
        cur.close()

        #si el usuario y la contraseña son correctas
        if usuario and usuario[2] == contrasena:
            session['user_id'] = usuario[1]    
            session['id_paciente'] = usuario[0]  # guardar el id_paciente en la sesión
            resp = make_response(redirect(url_for('index')))
            resp.set_cookie('correo', usuario[1])
            return resp
        else:
            #Si el usuario o la contraseña no son válidas
            return render_template('inicioSesion.html', error='Credenciales inválidas')

    # Aquí es donde manejas las solicitudes GET:
    else:
        return render_template('inicioSesion.html')
    
#Se cierrra la sesion y se redirige al usuario a la pagina de inicio
@app.route('/cerrarSesion')
def cerrarSesion():
    # Elimina la información de la sesión
    session.pop('user_id', None)

    # Crea una respuesta para redirigir al usuario al inicio
    resp = make_response(redirect(url_for('index')))

    # Elimina la cookie
    resp.set_cookie('correo', '', expires=0)

    return resp

#Entra al template de los 
@app.route('/horariosMedicos')
def horariosMedicos():
    return render_template('horariosMedicos.html')

@app.route('/listaDeMedicos')
def mostrarMedicos():
    if 'correo' not in request.cookies:
        # User is not logged in, redirect to login page
        return redirect(url_for('inicioSesion'))
    
    cur = mysql.connection.cursor()
    cur.callproc('GetAllMedicos')

    medicos = cur.fetchall()

    cur.close()
    
    return render_template('listaDeMedicos.html', medicos=medicos)


@app.route('/calendario/<int:medico_id>')
def mostrarCalendario(medico_id):
    if 'correo' not in request.cookies:
        # User is not logged in, redirect to login page
        return redirect(url_for('inicioSesion'))

    # Obtener el id_paciente de la sesión
    id_paciente = session.get('id_paciente')
    cur = mysql.connection.cursor()
    cur2 = mysql.connection.cursor()
    cur.execute("SELECT id_cita,id_medico,id_paciente,title,Fecha_Hora,Hora_Fin FROM CITAS where id_medico = %s;",(medico_id,))
    calendars = cur.fetchall()

    # Obtener información del médico
    cur2.execute("SELECT nombre, id_medico FROM MEDICO WHERE id_medico = %s;", (medico_id,))
    medico = cur2.fetchall()

    cur.close()
    cur2.close()
    
    return render_template('calendar.html' , calendars = calendars, medico = medico, id_paciente = id_paciente)

@app.route("/insert/<int:medico_id>:<int:id_paciente>",methods=["POST"])
def insert(medico_id, id_paciente):

    cur = mysql.connection.cursor()
    if request.method == 'POST':
        title = request.form['title']
        fecha_hora = request.form['start']
        hora_fin = request.form['end']  
        cur.execute("INSERT INTO CITAS (id_medico,id_paciente,title,Fecha_Hora,Hora_Fin) VALUES (%s,%s,%s,%s,%s)",[medico_id, id_paciente,title,fecha_hora,hora_fin])
        mysql.connection.commit()       
        cur.close()
        msg = 'Cita agendada con éxito'  
    return jsonify(msg)


@app.route('/registro', methods=['GET', 'POST'])
def registroUsusario():
    if request.method == 'POST':
        # obtener los datos del formulario
        nombre = request.form['nombre']
        fecha_nacimiento_str = request.form['fecha_nacimiento']
        direccion = request.form['direccion']
        telefono = request.form['telefono']
        correo = request.form['correo']
        contrasena = request.form['contrasena']
        apellido = request.form['apellido']

        # validar que se hayan ingresado todos los datos
        if not nombre or  not direccion or not telefono or not correo or not contrasena:
            error = 'Por favor ingrese todos los datos.'
            return render_template('registro.html', error=error)

        # convertir la cadena de fecha a una fecha de Python
        fecha_nacimiento = datetime.strptime(fecha_nacimiento_str, '%Y-%m-%d').date()


        # insertar los datos en la tabla
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO PACIENTE(nombre, fecha_nacimiento, direccion, telefono, correo, contrasena, apellido) VALUES(%s, %s, %s, %s, %s, %s, %s)", (nombre, fecha_nacimiento, direccion, telefono, correo, contrasena, apellido))
        mysql.connection.commit()
        cur.close()

        # redireccionar a la página de inicio después de la inserción
        return redirect(url_for('index'))

    # mostrar la página de registro
    return render_template('registro.html')


@app.route('/ubicacion')
def ubicacion():
    return render_template('ubicacion.html')

@app.route('/promos')
def promos():
    return render_template('promos.html')

@app.route('/config')
def config():
    id_paciente = session.get('id_paciente')  # obtener el id_paciente de la sesión
    if id_paciente is None:
        # si id_paciente es None, significa que el usuario no ha iniciado sesión
        return redirect(url_for('inicioSesion'))  # redirige al usuario a la página de inicio de sesión

    cur = mysql.connection.cursor()
    cur.callproc('GetPaciente', [id_paciente])

    paciente = cur.fetchone()
    cur.close()

    if paciente is None:
        # si el paciente es None, significa que no se encontró ningún paciente con ese ID
        return redirect(url_for('inicioSesion'))  # redirige al usuario a la página de inicio de sesión

    paciente_dict = {
        'nombre': paciente[1],  # Asegúrate de que estos índices correspondan a las columnas correctas en tu tabla PACIENTE
        'apellido': paciente[7],
        'correo': paciente[5],
        'telefono': paciente[4],
        'fecha_nacimiento': paciente[2]
    }

    return render_template('config.html', paciente=paciente_dict, id_paciente = id_paciente)


@app.route('/editarPerfil/<id_paciente>')
def editarPerfil(id_paciente):
    id_paciente = session.get('id_paciente')  # obtener el id_paciente de la sesión
    if id_paciente is None:
        # si id_paciente es None, significa que el usuario no ha iniciado sesión
        return redirect(url_for('inicioSesion'))  # redirige al usuario a la página de inicio de sesión

    cur = mysql.connection.cursor()
    cur.callproc('GetPaciente', [id_paciente])

    paciente = cur.fetchone()
    cur.close()

    if paciente is None:
        # si el paciente es None, significa que no se encontró ningún paciente con ese ID
        return redirect(url_for('inicioSesion'))  # redirige al usuario a la página de inicio de sesión

    paciente_dict = {
        'nombre': paciente[1],  # Asegúrate de que estos índices correspondan a las columnas correctas en tu tabla PACIENTE
        'apellido': paciente[7],
        'correo': paciente[5],
        'telefono': paciente[4],
        'fecha_nacimiento': paciente[2]
    }

    return render_template('editarPerfil.html', paciente=paciente_dict, id_paciente = id_paciente)

@app.route('/confirmarEditarPerfil/<id_paciente>', methods=['POST'])
def confirmarEditarPerfil(id_paciente):
    nombre = request.form['nombre']
    apellido = request.form['apellido']
    correo = request.form['correo']
    telefono = request.form['telefono']
    fecha_nacimiento = request.form['fechaNacimiento']

    cur = mysql.connection.cursor()
    cur.callproc('UpdatePaciente', [id_paciente, nombre, apellido, correo, telefono, fecha_nacimiento])
    mysql.connection.commit()
    cur.close()

    return redirect(url_for('config'))














@app.route('/verHistMedico', methods=['GET'])
def verHistMedico():
    id_paciente = session.get('id_paciente')  # obtener el id_paciente de la sesión
    if id_paciente is None:
        # si id_paciente es None, significa que el usuario no ha iniciado sesión
        return redirect(url_for('login'))  # redirige al usuario a la página de inicio de sesión

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM HISTORIAL_CLINICO WHERE id_paciente = %s", (id_paciente,))
    hist_medico = cur.fetchone()
    cur.close()

    if hist_medico is None:
        # si hist_medico es None, significa que el usuario no tiene un historial médico registrado
        return redirect(url_for('registroHistMedico'))  # redirige al usuario a la página de registro de historial médico

    # convertir el resultado de la consulta en un diccionario para facilitar el acceso en la plantilla
    hist_medico_dict = {
        'fechaNacimiento': hist_medico[2],
        'enfermedadesPrevias': hist_medico[3],
        'medicamentos': hist_medico[4],
        'cirugias': hist_medico[5],
        'antecedentes': hist_medico[6],
        'tipoSangre': hist_medico[7],
        'alergias': hist_medico[8],
    }

    return render_template('verHistMedico.html', hist_medico=hist_medico_dict)



@app.route('/histMedico', methods=['GET', 'POST'])
def registroHistMedico():
    id_paciente = session.get('id_paciente')  # obtener el id_paciente de la sesión
    if id_paciente is None:
        # si id_paciente es None, significa que el usuario no ha iniciado sesión
        return redirect(url_for('login'))  # redirige al usuario a la página de inicio de sesión

    cur = mysql.connection.cursor()
    cur.callproc('GetHistorialClinico', [id_paciente])
    hist_medico = cur.fetchone()
    cur.close()

    if request.method == 'POST':
        # obtener los datos del formulario
        enfermedadesPrevias = request.form['enfermedadesPrevias']
        fecha_nacimiento_str = request.form['fechaNacimiento']
        medicamentos = request.form['medicamentos']
        cirugias = request.form['cirugias']
        antecedentes = request.form['antecedentes']
        tipoSangre = request.form['tipoSangre']
        alergias = request.form['alergias']

        # convertir la cadena de fecha a una fecha de Python
        fechaNacimiento = datetime.datetime.strptime(fecha_nacimiento_str, '%Y-%m-%d').date()

        # insertar los datos en la tabla
        cur = mysql.connection.cursor()
        cur.callproc('InsertIntoHistorialClinico', [id_paciente, fechaNacimiento, enfermedadesPrevias, medicamentos, cirugias, antecedentes, tipoSangre, alergias])


        mysql.connection.commit()
        cur.close()

        # redireccionar a la página de inicio después de la inserción
        return render_template('index.html')

    elif hist_medico:
        # si el historial medico ya existe, mostramos la información en lugar del formulario
        return render_template('verHistMedico.html', hist_medico=hist_medico)
    else:
        # mostrar la página de registro
        return render_template('histMedico.html')
    
@app.route('/checkHistMedico', methods=['GET'])
def checkHistMedico():
    id_paciente = session.get('id_paciente')
    if id_paciente is None:
        # si id_paciente es None, significa que el usuario no ha iniciado sesión
        return redirect(url_for('login'))  # redirige al usuario a la página de inicio de sesión

    cur = mysql.connection.cursor()
    cur.callproc('GetHistorialClinico', [id_paciente])
    hist_medico = cur.fetchone()
    cur.close()

    if hist_medico:
        # si el historial medico ya existe, mostramos la información en lugar del formulario
        return redirect(url_for('verHistMedico'))
    else:
        # mostrar la página de registro
        return redirect(url_for('registroHistMedico'))


if __name__=='__main__':
    app.run(port=5005,debug=True)


