class AddNombreAndApellidoToAlumnos < ActiveRecord::Migration[7.0]
  def change
    add_column :alumnos, :nombre, :string
    add_column :alumnos, :apellido, :string
  end
end
