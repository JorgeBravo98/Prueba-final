require 'test_helper'

class EvaluacionesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

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

    @alumno = Alumno.create!(
      email: "alumno@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Pedro",
      apellido: "López",
      nombre_usuario: "pedrolopez",
      numero_alumno: 123456
    )

    @evaluacion = @curso.evaluaciones.create!(
      nombre_evaluacion: "Evaluación 1",
      fecha_inicio: Time.now,
      fecha_termino: Time.now + 2.days,
      alumno_id: @alumno.id
    )
  end

  # Test para verificar que un profesor autenticado puede ver las evaluaciones de su curso
  test "profesor autenticado puede ver evaluaciones de su curso" do
    sign_in @profesor
    get curso_evaluaciones_path(@curso)
    assert_response :success
    assert_select "h1", "Evaluaciones del curso #{@curso.nombre}"
    assert_select "td", @evaluacion.nombre_evaluacion
  end

  # Test para verificar que un profesor puede crear una evaluación
  test "profesor puede crear una evaluación" do
    sign_in @profesor

    assert_difference 'Evaluacion.count', 1 do
      post curso_evaluaciones_path(@curso), params: {
        evaluacion: {
          nombre_evaluacion: "Nueva Evaluación",
          fecha_inicio: Time.now,
          fecha_termino: Time.now + 2.days,
          alumno_id: @alumno.id
        }
      }
    end

    assert_redirected_to curso_evaluaciones_path(@curso)
    follow_redirect!
    assert_select "td", "Nueva Evaluación"
  end

  # Test para verificar que un profesor puede editar una evaluación
  test "profesor puede editar una evaluación" do
    sign_in @profesor

    patch curso_evaluacione_path(@curso, @evaluacion), params: {
      evaluacion: { nombre_evaluacion: "Evaluación Editada" }
    }

    assert_redirected_to curso_evaluaciones_path(@curso)
    follow_redirect!
    assert_select "td", "Evaluación Editada"
  end

  # Test para verificar que un profesor puede eliminar una evaluación
  test "profesor puede eliminar una evaluación" do
    sign_in @profesor

    assert_difference 'Evaluacion.count', -1 do
      delete curso_evaluacione_path(@curso, @evaluacion)
    end

    assert_redirected_to curso_evaluaciones_path(@curso)
  end

  ##### Test para verificar que un profesor puede calificar una evaluación
  ## Por arreglar con respecto al controlador
  ####test "profesor puede calificar una evaluación" do
  ####  sign_in @profesor
####
  ####  patch calificar_curso_evaluacione_path(@curso, @evaluacion), params: {
  ####    evaluacion: { calificacion: 6.0 }
  ####  }
####
  ####  assert_redirected_to curso_evaluaciones_path(@curso)  # Verifica la redirección correcta
  ####  follow_redirect!
  ####  assert_equal 6.0, @evaluacion.reload.calificacion  # Verifica que la calificación se haya guardado
  ####end

  # Test para verificar que solo el profesor del curso puede eliminar la evaluación
  ## Por arreglar en los controladores
  ##test "solo el profesor del curso puede eliminar la evaluación" do
  ##  otro_profesor = Profesor.create!(
  ##    email: "otro_profesor@example.com",
  ##    password: "password",
  ##    password_confirmation: "password",
  ##    nombre: "Otro",
  ##    apellido: "Garcia",
  ##    nombre_usuario: "otrog"
  ##  )
##
  ##  sign_in otro_profesor
##
  ##  assert_no_difference 'Evaluacion.count' do
  ##    delete curso_evaluacione_path(@curso, @evaluacion)
  ##  end
##
  ##  assert_redirected_to cursos_path  # Verifica que el profesor no autorizado es redirigido
  ##end
end
