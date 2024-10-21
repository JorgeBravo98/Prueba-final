class AddRememberCreatedAtToAlumnos < ActiveRecord::Migration[7.0]
  def change
    add_column :alumnos, :remember_created_at, :datetime
  end
end
