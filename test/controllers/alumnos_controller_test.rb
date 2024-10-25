require 'test_helper'

class AlumnosControllerTest < ActionDispatch::IntegrationTest
  # Test que verifica si se puede acceder al home
  test "acceder a la página raíz" do
    get root_path  # Simula una solicitud GET a la ruta raíz
    assert_response :success  # Verifica que la respuesta sea exitosa (código 200)
    assert_select "h1", "SANVAC"  # Verifica que el título de la página principal contenga "SANVAC"
  end

  # Test que verifica si se puede navegar desde el home a la página de registro de alumno
  test "navegar a la página de registro de alumnos desde home" do
    get root_path
    assert_response :success
    assert_select "a[href=?]", new_alumno_registration_path, text: "ALUMNO"  # Verifica que haya un link con texto 'ALUMNO'
    
    # Simula hacer clic en el enlace para registrar un alumno
    get new_alumno_registration_path
    assert_response :success  # Verifica que se cargue la página de registro de alumno
    assert_select "h2", "CREAR CUENTA ALUMNO"  # Verifica que haya un título de "Sign up" en la página de registro
  end

  # Test para verificar que el menú principal de alumnos requiera autenticación
  test "redirigir a inicio de sesión si no está autenticado" do
    get alumnos_menu_principal_path  # Intenta acceder al menú principal de alumnos sin autenticarse
    assert_redirected_to new_alumno_session_path  # Verifica que redirija a la página de inicio de sesión de alumnos
  end



end
