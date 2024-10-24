class CreateArchivos < ActiveRecord::Migration[7.0]
  def change
    create_table :archivos do |t|
      t.string :nombre
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
