class CreateEvaluacions < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluacions do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :alumno, null: false, foreign_key: true
      t.string :nombre_evaluacion
      t.float :calificacion
      t.date :fecha_inicio
      t.date :fecha_termino

      t.timestamps
    end
  end
end
