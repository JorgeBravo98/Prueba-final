class RenameMailToEmailInAlumnos < ActiveRecord::Migration[7.0]
  def change
    rename_column :alumnos, :mail, :email
  end
end
