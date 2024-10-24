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
    const filtroAlumnosInput = document.getElementById('filtro-alumnos');
    const alumnosList = document.querySelectorAll('.alumno-item');
    
    // Mantén el filtro de alumnos
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

    const form = document.querySelector('form'); 
    const nombreGrupoInput = document.getElementById('grupo_nombre'); 
    const alumnosCheckboxes = document.querySelectorAll('input[name="grupo[alumno_ids][]"]'); 

    form.addEventListener('submit', function(event) {
        let hasAlumnos = false;

        // Revisa si al menos un checkbox de alumno está seleccionado
        alumnosCheckboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                hasAlumnos = true;
            }
        });

        // Mostramos las alertas sin bloquear el envío del formulario
        if (nombreGrupoInput.value.trim() === '') {
            mostrarAlerta('Por favor, ingrese un nombre para el grupo.', 'error');
        }

        if (!hasAlumnos) {
            mostrarAlerta('Por favor, seleccione al menos un alumno para el grupo.', 'error');
        }
    });

    function mostrarAlerta(mensaje, tipo) {
        const alerta = document.createElement('div');
        alerta.classList.add('alerta-flotante');

        if (tipo === 'error') {
            alerta.classList.add('alerta-error');
        }

        alerta.textContent = mensaje;
        document.body.appendChild(alerta);

        setTimeout(function() {
            alerta.classList.add('oculta');
        }, 2000);

        setTimeout(function() {
            alerta.remove();
        }, 4500);
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const eliminarBoton = document.getElementById('mostrar-modal');
    const modalEliminar = document.getElementById('confirm-modal');
    const cancelarEliminarBoton = document.getElementById('cancelar-eliminar');

    // Mostrar el modal al hacer clic en el botón de eliminar
    eliminarBoton.addEventListener('click', function() {
        modalEliminar.style.display = 'block'; // Mostramos el modal
    });

    // Ocultar el modal cuando el usuario presiona "Cancelar"
    cancelarEliminarBoton.addEventListener('click', function() {
        modalEliminar.style.display = 'none'; // Ocultamos el modal
    });

    // Ocultar el modal si se hace clic fuera de la ventana del modal
    window.addEventListener('click', function(event) {
        if (event.target == modalEliminar) {
            modalEliminar.style.display = 'none'; // Ocultamos el modal
        }
    });
});
// Función para abrir el modal y configurar el enlace de eliminación
function openModal(cursoId) {
    document.getElementById("eliminarCursoModal").style.display = "flex";
    const deleteButton = document.getElementById("delete-course-button");
    deleteButton.setAttribute("formaction", `/cursos/${cursoId}`);
  }
  
  // Función para cerrar el modal
  function closeModal() {
    document.getElementById("eliminarCursoModal").style.display = "none";
  }
  


  document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('confirm-modal');
    var openModalBtn = document.getElementById('open-modal');
    var cancelBtn = document.getElementById('cancelar-eliminar');
  
    openModalBtn.addEventListener('click', function(event) {
      event.preventDefault(); // Evita el envío del formulario
      modal.style.display = 'block'; // Muestra el modal
    });
  
    cancelBtn.addEventListener('click', function() {
      modal.style.display = 'none'; // Oculta el modal
    });
  });
  