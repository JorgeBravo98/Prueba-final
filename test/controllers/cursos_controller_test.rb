require 'test_helper'

class CursosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Configura un profesor y curso para las pruebas
  setup do
    @profesor = Profesor.create!(
      email: "profesor@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Juan",
      apellido: "Pérez",
      nombre_usuario: "juanperez"
    )
    
    @curso = Curso.create!(
      nombre: "Curso de Prueba",
      sigla: "CP101",
      descripcion: "Descripción del curso",
      profesor: @profesor
    )
  end

  # Test para verificar que el profesor autenticado pueda ver sus cursos
  test "profesor autenticado puede ver sus cursos" do
    sign_in @profesor
    get cursos_path
    assert_response :success
    assert_select "h1", "Mis Cursos"
    assert_select "strong", @curso.nombre
  end

  # Test para verificar que el profesor pueda crear un curso
  test "profesor puede crear un curso" do
    sign_in @profesor

    assert_difference 'Curso.count', 1 do
      post cursos_path, params: {
        curso: {
          nombre: "Nuevo Curso",
          sigla: "NC101",
          descripcion: "Descripción del nuevo curso"
        }
      }
    end

    assert_redirected_to curso_path(Curso.last)
    follow_redirect!
    assert_select "h1", "Nuevo Curso - NC101"
  end

  # Test para verificar que un profesor pueda editar su propio curso
  test "profesor puede editar su curso" do
    sign_in @profesor

    patch curso_path(@curso), params: {
      curso: {
        nombre: "Curso Editado"
      }
    }

    assert_redirected_to curso_path(@curso)
    follow_redirect!
    assert_select "h1", "Curso Editado - CP101"
  end

  # Test para verificar que solo el profesor propietario del curso puede editar el curso
  test "solo el profesor propietario puede editar el curso" do
    otro_profesor = Profesor.create!(
      email: "otro_profesor@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Otro",
      apellido: "García",
      nombre_usuario: "otrogarcia"
    )
    
    sign_in otro_profesor

    patch curso_path(@curso), params: {
      curso: { nombre: "Curso Hackeado" }
    }

    assert_redirected_to cursos_path
    follow_redirect!
    assert_select "div.alert", "No tienes permiso para modificar este curso."
  end

  # Test para verificar que un profesor pueda eliminar su curso
  test "profesor puede eliminar su curso" do
    sign_in @profesor
    assert_difference 'Curso.count', -1 do
      delete curso_path(@curso)
    end
    assert_redirected_to cursos_path  # Verifica que redirige a la página de cursos correctamente
  end

  # Test para verificar que solo el profesor propietario puede eliminar su curso
  test "solo el profesor propietario puede eliminar el curso" do
    otro_profesor = Profesor.create!(
      email: "otro_profesor@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Otro",
      apellido: "García",
      nombre_usuario: "otrogarcia"
    )

    sign_in otro_profesor

    assert_no_difference 'Curso.count' do
      delete curso_path(@curso)
    end

    assert_redirected_to cursos_path
    follow_redirect!
    assert_select "div.alert", "No tienes permiso para modificar este curso."
  end
end
