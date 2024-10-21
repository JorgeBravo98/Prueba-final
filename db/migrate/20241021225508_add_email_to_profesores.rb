class AddEmailToProfesores < ActiveRecord::Migration[7.0]
  def change
    add_column :profesores, :email, :string
  end
end
