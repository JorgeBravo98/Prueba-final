class CreateAlumnos < ActiveRecord::Migration[7.0]
  def change
    create_table :alumnos do |t|
      t.integer :numero_alumno
      t.string :mail
      t.string :nombre
      t.string :apellido
      t.string :nombre_usuario
      t.string :avatar
      t.string :contraseña

      t.timestamps
    end
  end
end
