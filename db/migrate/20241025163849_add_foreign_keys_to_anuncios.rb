class AddForeignKeysToAnuncios < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :anuncios, :cursos, column: :curso_id, on_delete: :cascade
    add_foreign_key :anuncios, :profesores, column: :profesor_id, on_delete: :cascade
  end
end
