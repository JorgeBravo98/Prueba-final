class AddDetailsToAnuncios < ActiveRecord::Migration[7.0]
  def change
    add_column :anuncios, :titulo, :string
    add_column :anuncios, :contenido, :text
  end
end
