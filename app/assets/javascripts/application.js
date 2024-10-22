//= require rails-ujs
document.addEventListener('DOMContentLoaded', function() {
    const filtroAlumnosInput = document.getElementById('filtro-alumnos');
    const alumnosList = document.querySelectorAll('.alumno-item');
  
    // Filtro de alumnos
    filtroAlumnosInput.addEventListener('input', function() {
      const filtro = filtroAlumnosInput.value.toLowerCase();
  
      alumnosList.forEach(function(alumnoItem) {
        const numeroAlumno = alumnoItem.getAttribute('data-numero');
        
        if (numeroAlumno.includes(filtro)) {
          alumnoItem.style.display = 'block';
        } else {
          alumnoItem.style.display = 'none';
        }
      });
    });
  
    // Manejo de la alerta
    const alert = document.querySelector('.alert-notice');  // Selecciona el elemento con la clase .alert
  
    if (alert) {
        // Hace que la alerta desaparezca después de 2 segundos
        setTimeout(function() {
        alert.style.opacity = '0'; // Cambiar la opacidad para desaparecer lentamente
        }, 2000); // Desaparece después de 2 segundos

        // Elimina la alerta del DOM después de que la transición termine
        setTimeout(function() {
        alert.remove();
        }, 2500); // Elimina el nodo después de 0.5 segundos
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('confirm-modal');
    const mostrarModalBtn = document.getElementById('mostrar-modal');
    const cancelarEliminarBtn = document.getElementById('cancelar-eliminar');
  
    mostrarModalBtn.addEventListener('click', function() {
      modal.style.display = 'block'; // Muestra el modal
    });
  
    cancelarEliminarBtn.addEventListener('click', function() {
      modal.style.display = 'none'; // Oculta el modal al cancelar
    });
  
    // Cerrar el modal si se hace clic fuera de la ventana modal
    window.addEventListener('click', function(event) {
      if (event.target == modal) {
        modal.style.display = 'none';
      }
    });
  });
  