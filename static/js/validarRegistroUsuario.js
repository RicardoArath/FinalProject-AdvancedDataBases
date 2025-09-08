document.addEventListener("DOMContentLoaded", function() {
// Obtener referencias a los elementos del formulario
const form = document.querySelector("#registro-form");
const contrasenaInput = document.querySelector("#contrasena");
const repetirContrasenaInput = document.querySelector("#repetirContrasena");
const submitBtn = document.querySelector("#registro-btn");

// Función para validar el formulario
function validarFormulario() {

  // Verificar si las contraseñas son iguales
  if (contrasenaInput.value !== repetirContrasenaInput.value) {
    alert("Las contraseñas no coinciden");
    return false;
  }
  return true;
}

// Función para enviar la solicitud de registro a través de AJAX
function enviarRegistro(event) {
	document.form[0].submit();
  }
  

// Asignar la función enviarRegistro al evento click del botón de registro
submitBtn.addEventListener("click", enviarRegistro);
  });

