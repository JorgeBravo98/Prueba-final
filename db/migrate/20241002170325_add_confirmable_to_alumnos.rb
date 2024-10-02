class AddConfirmableToAlumnos < ActiveRecord::Migration[7.0]
  def change
    add_column :alumnos, :confirmation_token, :string
    add_column :alumnos, :confirmed_at, :datetime
    add_column :alumnos, :confirmation_sent_at, :datetime
    add_column :alumnos, :unconfirmed_email, :string
    add_index :alumnos, :confirmation_token, unique: true
  end
end
