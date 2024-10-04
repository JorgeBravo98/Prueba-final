class DropAlumnosTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :alumnos, if_exists: true
  end
end
