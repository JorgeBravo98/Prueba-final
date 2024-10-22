class RemoveIncorrectForeignKeyFromCursos < ActiveRecord::Migration[7.0]
  def change
    # Eliminar la clave foránea incorrecta
    remove_foreign_key :cursos, :profesors

    # Asegúrate de agregar la clave foránea correcta apuntando a profesores
    add_foreign_key :cursos, :profesores, column: :profesor_id
  end
end
