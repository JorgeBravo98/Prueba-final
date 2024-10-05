class CreateCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :sigla
      t.references :profesor, null: false, foreign_key: true  # Asegúrate de que este es el caso

      t.timestamps
    end
  end
end
