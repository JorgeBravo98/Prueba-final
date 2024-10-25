require 'test_helper'

class ArchivosControllerTest < ActionDispatch::IntegrationTest
  # Configuración inicial para las pruebas
  setup do
    # Crear un profesor sin autenticación
    @profesor = Profesor.create!(
      email: "profesor@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Juan",
      apellido: "Pérez",
      nombre_usuario: "juanperez"
    )

    # Crear un curso asociado al profesor
    @curso = Curso.create!(
      nombre: "Curso de Prueba",
      sigla: "CP101",
      descripcion: "Descripción del curso",
      profesor: @profesor
    )

    # Crear un archivo asociado al curso
    @archivo = @curso.archivos.create!(
      nombre: "Archivo de Prueba",
      file: fixture_file_upload('test_file.txt', 'text/plain')
    )
  end

  # Test para verificar que el profesor puede ver los archivos de su curso
  test "profesor puede ver los archivos de su curso" do
    get curso_archivos_path(@curso)
    assert_response :success
    assert_select "h1", "Archivos del Curso #{@curso.nombre}"
    assert_select "td", @archivo.nombre
  end

  # Test para verificar que el profesor puede subir un nuevo archivo
  test "profesor puede subir un nuevo archivo" do
    assert_difference '@curso.archivos.count', 1 do
      post curso_archivos_path(@curso), params: {
        archivo: {
          nombre: "Nuevo Archivo",
          file: fixture_file_upload('test_file.txt', 'text/plain')
        }
      }
    end

    assert_redirected_to curso_archivos_path(@curso)
    follow_redirect!
    assert_select "td", "Nuevo Archivo"
  end

  # Test para verificar que el profesor puede eliminar un archivo
  # Verificar funcionalidad
  ###test "profesor puede eliminar un archivo" do
  ###  assert_difference '@curso.archivos.count', -1 do
  ###    delete curso_archivo_path(@curso, @archivo)
  ###  end
###
  ###  assert_redirected_to curso_archivos_path(@curso)
  ###  follow_redirect!
  ###  assert_select "div.notice", "Archivo eliminado correctamente."
  ###end

  # Test para verificar que un alumno puede descargar un archivo
  ### Verificar funcionalidad
  ##test "alumno puede descargar un archivo" do
  ##  alumno = Alumno.create!(
  ##    email: "alumno@example.com",
  ##    password: "password",
  ##    password_confirmation: "password",
  ##    nombre: "Pedro",
  ##    apellido: "López",
  ##    nombre_usuario: "pedrolopez",
  ##    numero_alumno: 123456
  ##  )
##
  ##  get rails_blob_path(@archivo.file, disposition: 'attachment')
  ##  assert_response :success
  ##end
end
