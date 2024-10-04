class AddResetPasswordToProfesores < ActiveRecord::Migration[7.0]
  def change
    add_column :profesores, :reset_password_token, :string
    add_index :profesores, :reset_password_token
    add_column :profesores, :reset_password_sent_at, :datetime
  end
end
