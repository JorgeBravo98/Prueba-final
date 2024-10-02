class CreateProfesores < ActiveRecord::Migration[7.0]
  def change
    create_table :profesores do |t|
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
