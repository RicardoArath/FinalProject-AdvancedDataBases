
$(document).ready(function() {
    $('#calendar-container').fullCalendar({
        // Opciones y callbacks para tu calendario
        dayClick: function(date, jsEvent, view) {
            // Esto se ejecutará cuando el usuario haga clic en un día
            // Puedes utilizarlo para rellenar automáticamente la fecha en tu formulario
            document.getElementById('fechaHoraInicio').value = date.format();
            document.getElementById('fechaHoraFin').value = date.add(1, 'hours').format();
        }
    });
});

