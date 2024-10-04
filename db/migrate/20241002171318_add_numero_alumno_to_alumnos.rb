class AddNumeroAlumnoToAlumnos < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:alumnos, :numero_alumno)
      add_column :alumnos, :numero_alumno, :integer
    end
  end
end
