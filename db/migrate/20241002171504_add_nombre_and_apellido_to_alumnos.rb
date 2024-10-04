class AddNombreAndApellidoToAlumnos < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:alumnos, :nombre)
      add_column :alumnos, :nombre, :string
    end

    unless column_exists?(:alumnos, :apellido)
      add_column :alumnos, :apellido, :string
    end
  end
end
