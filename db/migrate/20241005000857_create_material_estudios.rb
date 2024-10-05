class CreateMaterialEstudios < ActiveRecord::Migration[7.0]
  def change
    create_table :material_estudios do |t|
      t.references :curso, null: false, foreign_key: true
      t.date :fecha
      t.text :descripcion
      t.string :tipo_archivo

      t.timestamps
    end
  end
end
