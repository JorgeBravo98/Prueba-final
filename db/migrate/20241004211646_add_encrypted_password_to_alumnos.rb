class AddEncryptedPasswordToAlumnos < ActiveRecord::Migration[7.0]
  def change
    add_column :alumnos, :encrypted_password, :string
  end
end
