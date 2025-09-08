document.addEventListener("DOMContentLoaded", function() {
    // Obtener referencias a los elementos del formulario
    const form = document.querySelector("#histMedico-form");
    const submitBtn = document.querySelector("#histMedico-btn");
    
    // Función para enviar la solicitud de registro a través de AJAX
    function enviarRegistro(event) {
        event.preventDefault(); // Prevenir el envío del formulario normal
      
        // Obtener los datos del formulario
        const datos = {
            "fechaNacimiento": form.fechaNacimiento.value,
            "enfermedadesPrevias": form.enfermedadesPrevias.value,
            "medicamentos": form.medicamentos.value,
            "cirugias": form.cirugias.value,
            "antecedentes": form.antecedentes.value,
            "tipoSangre": form.tipoSangre.value,
            "alergias": form.alergias.value
        };
      
        // Enviar los datos del formulario como una cadena JSON
        fetch("/histMedico", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(datos)
        })
        .then(response => {
            if (response.ok) {
                alert("Registro exitoso");
                form.reset(); // Limpiar el formulario
            } else {
                alert("Error al registrar");
            }
        })
        .catch(error => {
            alert("Error al registrar");
        });
    }

    // Asignar la función enviarRegistro al evento click del botón de registro
    submitBtn.addEventListener("click", enviarRegistro);
});
