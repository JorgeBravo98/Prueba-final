require "test_helper"

class CursoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # El curso es válido si tiene todos sus atributos
  test "El curso es válido si tiene todos sus atributos" do
    # antes de hacer el test, se debe crear un profesor, pues los cursos están asociados a un profesor
    profesor = Profesor.new(
      email: "holaha@gmail.com",
      nombre: "Juan",
      apellido: "Perez",
      nombre_usuario: "juanperez",
      password: "123456",  # Usamos password, como espera Devise
      password_confirmation: "123456",  # Para confirmar la contraseña, opcional
      lista_cursos: ""
    )
    
    # Simula la subida de un archivo
    profesor.avatar.attach(io: File.open(Rails.root.join('test/fixtures/files/avatar.png')), filename: 'avatar.png', content_type: 'image/png')
    assert profesor.save, "El profesor no se guardó"
    unless profesor.save
      puts profesor.errors.full_messages
    end
    # curso tiene todos sus atributos
    curso = Curso.new(
      nombre: "Curso de prueba",
      descripcion: "Curso de prueba",
      profesor_id: profesor.id,
      sigla: "CP"
    )

    # Verifica si hay errores de validación
    unless curso.save
      puts curso.errors.full_messages
    end

    assert curso.save, "El curso no se guardó"
  end
end
