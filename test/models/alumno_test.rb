require "test_helper"


#create_table "alumnos", force: :cascade do |t|
#  t.integer "numero_alumno"
#  t.string "email"
#  t.string "nombre"
#  t.string "apellido"
#  t.string "nombre_usuario"
#  t.string "avatar"
#  t.string "contraseña"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#  t.string "encrypted_password"
#  t.datetime "remember_created_at"
#end


class AlumnoTest < ActiveSupport::TestCase
  # El alumno debe tener email
  test "El alumno debe tener email" do
    alumno = Alumno.new
    assert_not alumno.save, "El alumno se guardó sin email"
  end

  test "validations del alumno" do
    alumno = Alumno.new(numero_alumno: nil)
    assert_not alumno.valid?, "El alumno debería ser inválido sin numero_alumno"
    assert_not_empty alumno.errors[:numero_alumno], "Debería haber un error para numero_alumno"
  end
  

  # El alumno es válido si tiene todos sus atributos
  test "El alumno es válido si tiene todos sus atributos" do
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
    # Verifica si hay errores de validación
    unless alumno.save
      puts alumno.errors.full_messages
    end
    assert alumno.save, "El alumno no se guardó"
  end
end

