require "test_helper"

class GrupoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # El grupo debe tener nombre
  test "El grupo debe tener nombre" do
    grupo = Grupo.new
    assert_not grupo.save, "El grupo se guardó sin nombre"
  end

  # No se puede crear grupo sin curso
  test "El grupo debe tener curso" do
    profesor = Profesor.new(
      email: "holaha@gmail.com",
      nombre: "Juan",
      apellido: "Perez",
      nombre_usuario: "juanperez",
      password: "123456",  # Usamos password, como espera Devise
      password_confirmation: "123456",  # Para confirmar la contraseña, opcional
      lista_cursos: "Curso de prueba"
    )
    
    # Simula la subida de un archivo
    profesor.avatar.attach(io: File.open(Rails.root.join('test/fixtures/files/avatar.png')), filename: 'avatar.png', content_type: 'image/png')
    
    alumno = Alumno.new(
      email: "holaha@gmail.com",
      nombre: "Juan",
      apellido: "Perez",
      nombre_usuario: "juanperez",
      numero_alumno: 123456,
      password: "123456",  # Usamos password, como espera Devise
      password_confirmation: "123456"  # Para confirmar la contraseña, opcional
    )
    
    # Simula la subida de un archivo
    alumno.avatar.attach(io: File.open(Rails.root.join('test/fixtures/files/avatar.png')), filename: 'avatar.png', content_type: 'image/png')

    grupo = Grupo.new(
      nombre: "Grupo de prueba",
      curso_id: nil
    )

    assert_not grupo.save, "El grupo se guardó sin curso"
  end


  # Para ser válido el grupo debe tener nombre y curso. Además, el grupo debe tener al menos un alumno y un curso debe existir
  #test "El grupo es válido si tiene todos sus atributos" do

    
  
end
