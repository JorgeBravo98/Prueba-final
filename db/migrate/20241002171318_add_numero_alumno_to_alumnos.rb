class AddNumeroAlumnoToAlumnos < ActiveRecord::Migration[7.0]
  def change
    add_column :alumnos, :numero_alumno, :integer
  end
end
