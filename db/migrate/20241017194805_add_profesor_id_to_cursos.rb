class AddProfesorIdToCursos < ActiveRecord::Migration[7.0]
  def change
    add_column :cursos, :profesor_id, :integer
  end
end
