class CreateAnuncios < ActiveRecord::Migration[7.0]
  def change
    create_table :anuncios do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :profesor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
