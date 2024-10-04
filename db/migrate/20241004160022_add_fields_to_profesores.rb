class AddFieldsToProfesores < ActiveRecord::Migration[7.0]
  def change
    add_column :profesores, :mail, :string unless column_exists?(:profesores, :mail)
    add_column :profesores, :nombre, :string unless column_exists?(:profesores, :nombre)
    add_column :profesores, :apellido, :string unless column_exists?(:profesores, :apellido)
    add_column :profesores, :nombre_usuario, :string unless column_exists?(:profesores, :nombre_usuario)
    add_column :profesores, :avatar, :string unless column_exists?(:profesores, :avatar)
    add_column :profesores, :contraseña, :string unless column_exists?(:profesores, :contraseña)
    add_column :profesores, :lista_cursos, :text unless column_exists?(:profesores, :lista_cursos)
  end
end
