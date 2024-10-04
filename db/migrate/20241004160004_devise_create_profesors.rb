class DeviseCreateProfesors < ActiveRecord::Migration[7.0]
  def up
    create_table :profesors do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :profesors, :email,                unique: true
    add_index :profesors, :reset_password_token, unique: true
  end

  def down
    if table_exists?(:profesors)
      remove_index :profesors, :reset_password_token if index_exists?(:profesors, :reset_password_token)
      drop_table :profesors
    end
  end
end
