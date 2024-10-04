class AddEncryptedPasswordToProfesores < ActiveRecord::Migration[7.0]
  def change
    add_column :profesores, :encrypted_password, :string, null: false, default: ""
  end
end
