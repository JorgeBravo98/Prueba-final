class AddForeignKeyToCursos < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cursos, :profesores, column: :profesor_id
  end
end
