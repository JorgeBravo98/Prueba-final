class RemoveConfirmableFromProfesores < ActiveRecord::Migration[7.0]
  def change
    remove_column :profesores, :confirmation_token, :string
    remove_column :profesores, :confirmed_at, :datetime
    remove_column :profesores, :confirmation_sent_at, :datetime
    remove_column :profesores, :unconfirmed_email, :string
  end
end
