class RemoveConfirmableFromAlumnos < ActiveRecord::Migration[7.0]
  def change
    remove_column :alumnos, :confirmation_token, :string
    remove_column :alumnos, :confirmed_at, :datetime
    remove_column :alumnos, :confirmation_sent_at, :datetime
    remove_column :alumnos, :unconfirmed_email, :string
  end
end
