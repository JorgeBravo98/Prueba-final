class RemoveContrasenaFromProfesores < ActiveRecord::Migration[7.0]
  def change
    remove_column :profesores, :contraseña, :string
  end
end
