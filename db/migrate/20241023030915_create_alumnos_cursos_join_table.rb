class CreateAlumnosCursosJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :alumnos_cursos, id: false do |t|
      t.references :alumno, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true
    end
  end
end
