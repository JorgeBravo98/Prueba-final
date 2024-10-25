class RemoveDuplicateForeignKeysFromAnuncios < ActiveRecord::Migration[7.0]
  def change
    # Eliminar claves foráneas duplicadas si existen
    remove_foreign_key :anuncios, column: :curso_id if foreign_key_exists?(:anuncios, column: :curso_id)
    remove_foreign_key :anuncios, column: :profesor_id if foreign_key_exists?(:anuncios, column: :profesor_id)
  end
end
