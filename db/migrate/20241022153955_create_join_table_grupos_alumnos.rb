class CreateJoinTableGruposAlumnos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :grupos, :alumnos do |t|
      # t.index [:grupo_id, :alumno_id]
      # t.index [:alumno_id, :grupo_id]
    end
  end
end
