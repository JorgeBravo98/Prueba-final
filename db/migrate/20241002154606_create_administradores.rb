class CreateAdministradores < ActiveRecord::Migration[7.0]
  def change
    create_table :administradores do |t|
      t.string :correo
      t.string :nombre
      t.string :apellido
      t.string :nombre_usuario
      t.string :contraseña

      t.timestamps
    end
  end
end
