class RemoveMailFromProfesores < ActiveRecord::Migration[7.0]
  def change
    remove_column :profesores, :mail, :string
  end
end
