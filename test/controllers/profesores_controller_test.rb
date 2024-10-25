require 'test_helper'

class ProfesoresControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # Incluye el módulo de Devise para usar sign_in y sign_out

  # Test que verifica si se puede acceder a la página de registro de profesores desde la raíz
  test "navegar a la página de registro de profesores desde home" do
    get root_path
    assert_response :success
    assert_select "a[href=?]", new_profesor_registration_path, text: "PROFESOR"  # Verifica el link con texto 'PROFESOR'
    
    # Simula hacer clic en el enlace para registrar un profesor
    get new_profesor_registration_path
    assert_response :success  # Verifica que la página de registro de profesor se carga correctamente
    assert_select "h2", "CREAR CUENTA PROFESOR"  # Verifica que haya un título "CREAR CUENTA PROFESOR"
  end

  # Test que verifica si se redirige al inicio de sesión cuando no está autenticado
  test "redirigir a inicio de sesión si no está autenticado" do
    get profesores_menu_principal_path  # Intenta acceder al menú principal de profesores sin autenticarse
    assert_redirected_to new_profesor_session_path  # Verifica que redirija a la página de inicio de sesión de profesores
  end

  # Test que verifica si un profesor autenticado puede acceder a su menú principal
  test "acceder al menú principal del profesor cuando está autenticado" do
    # Crea un profesor para usarlo en el test
    profesor = Profesor.create!(
      email: "profesor@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Juan",
      apellido: "Pérez",
      nombre_usuario: "juanperez"
    )

    # Inicia sesión como profesor
    sign_in profesor

    # Ahora intenta acceder al menú principal de profesores
    get profesores_menu_principal_path
    assert_response :success  # Verifica que se puede acceder correctamente

    # Verifica que el contenido del menú principal esté presente
    assert_select "h2", "Bienvenido Profesor #{profesor.nombre}!"
  end
end
