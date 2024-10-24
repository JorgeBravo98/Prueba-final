class AddDefaultToCalificacionInEvaluaciones < ActiveRecord::Migration[6.1]
  def change
    change_column_default :evaluaciones, :calificacion, from: 0, to: nil
  end
end
