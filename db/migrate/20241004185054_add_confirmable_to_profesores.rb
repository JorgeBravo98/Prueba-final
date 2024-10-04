class AddConfirmableToProfesores < ActiveRecord::Migration[7.0]
  def change
    add_column :profesores, :confirmation_token, :string
    add_column :profesores, :confirmed_at, :datetime
    add_column :profesores, :confirmation_sent_at, :datetime
    add_column :profesores, :unconfirmed_email, :string
  end
end
