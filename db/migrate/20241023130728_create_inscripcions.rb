class CreateInscripcions < ActiveRecord::Migration[7.0]
  def change
    create_table :inscripcions do |t|
      t.references :alumno, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
