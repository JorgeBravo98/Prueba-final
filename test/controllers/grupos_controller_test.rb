require 'test_helper'

class GruposControllerTest < ActionDispatch::IntegrationTest
  # Configuración inicial
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

    # Crear alumnos para agregar a los grupos
    @alumno1 = Alumno.create!(
      email: "alumno1@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Pedro",
      apellido: "López",
      nombre_usuario: "pedrolopez",
      numero_alumno: 123456
    )

    @alumno2 = Alumno.create!(
      email: "alumno2@example.com",
      password: "password",
      password_confirmation: "password",
      nombre: "Maria",
      apellido: "Sánchez",
      nombre_usuario: "mariasanchez",
      numero_alumno: 789012
    )

    # Crear un grupo asociado al curso y con alumnos
    @grupo = @curso.grupos.create!(
      nombre: "Grupo 1",
      alumno_ids: [@alumno1.id, @alumno2.id]
    )
  end

  # Test para verificar que el profesor puede ver los grupos de su curso
  #test "profesor puede ver los grupos de su curso" do
  #  get curso_grupos_path(@curso)
  #  assert_response :success
  #  assert_select "h1", "Grupos de #{@curso.nombre}"
  #  assert_select "li", text: "Grupo 1", count: 1
  #end

  # Test para verificar que el profesor puede crear un grupo
  ##test "profesor puede crear un grupo" do
  ## assert_difference 'Grupo.count', 1 do
  ##   post curso_grupos_path(@curso), params: {
  ##     grupo: {
  ##       nombre: "Nuevo Grupo",
  ##       alumno_ids: [@alumno1.id]
  ##     }
  ##   }
  ## end

  #  assert_redirected_to curso_grupos_path(@curso)
  #  follow_redirect!
  #  assert_select "li", text: "Nuevo Grupo", count: 1
  #end

  # Test para verificar que el profesor puede editar un grupo
  #test "profesor puede editar un grupo" do
  #  patch curso_grupo_path(@curso, @grupo), params: {
  #    grupo: {
  #      nombre: "Grupo Editado",
  #      alumno_ids: [@alumno1.id]
  #    }
  #  }
#
  #  assert_redirected_to curso_grupos_path(@curso)
  #  follow_redirect!
  #  assert_select "li", text: "Grupo Editado", count: 1
  #  assert_equal 1, @grupo.reload.alumnos.count
  #end

  # Test para verificar que el profesor puede ver el detalle de un grupo
  test "profesor puede ver el detalle de un grupo" do
    get curso_grupo_path(@curso, @grupo)
    assert_response :success
    assert_select "h1", "Grupo: #{@grupo.nombre}"
    assert_select "li", text: "#{@alumno1.nombre} #{@alumno1.apellido} - #{@alumno1.numero_alumno}", count: 1
  end

  # Test para verificar que el profesor puede eliminar un grupo
  test "profesor puede eliminar un grupo" do
    assert_difference 'Grupo.count', -1 do
      delete curso_grupo_path(@curso, @grupo)
    end

    assert_redirected_to curso_grupos_path(@curso)
  end
end
