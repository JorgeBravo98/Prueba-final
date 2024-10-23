class DropAlumnosCursosTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :alumnos_cursos
  end

  def down
    create_table :alumnos_cursos do |t|
      t.references :alumno, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
