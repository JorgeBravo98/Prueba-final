class AddForeignKeyConstraintsToAnuncios < ActiveRecord::Migration[7.0]
  def change
    # Agregar clave foránea a `curso_id`
    add_foreign_key :anuncios, :cursos, column: :curso_id, on_delete: :cascade
    
    # Agregar clave foránea a `profesor_id`
    add_foreign_key :anuncios, :profesores, column: :profesor_id, on_delete: :cascade
  end
end
