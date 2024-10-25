require "test_helper"

class ProfesorTest < ActiveSupport::TestCase
  # Test para verificar que un profesor se guarda correctamente con todos sus atributos
  test "El profesor es válido con todos sus atributos" do
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
    
    # Verifica si hay errores de validación
    unless profesor.save
      puts profesor.errors.full_messages
    end

    assert profesor.save, "El profesor no se guardó"
  end
end
