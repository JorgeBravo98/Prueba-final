class CreateCursos < ActiveRecord::Migration[7.0]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :sigla

      t.timestamps
    end
  end
end
