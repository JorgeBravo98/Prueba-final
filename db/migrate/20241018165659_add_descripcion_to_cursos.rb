class AddDescripcionToCursos < ActiveRecord::Migration[7.0]
  def change
    add_column :cursos, :descripcion, :string
  end
end
