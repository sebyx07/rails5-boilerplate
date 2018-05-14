class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: :false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true


    add_column :users, :last_login_at, :datetime, default: nil
    add_column :users, :last_logout_at, :datetime, default: nil
    add_column :users, :last_activity_at, :datetime, default: nil
    add_column :users, :last_login_from_ip_address, :string, default: nil

    add_index :users, [:last_logout_at, :last_activity_at]


    add_column :users, :failed_logins_count, :integer, default: 0
    add_column :users, :lock_expires_at, :datetime, default: nil
    add_column :users, :unlock_token, :string, default: nil

    add_index :users, :unlock_token


    create_table :authentications do |t|
      t.uuid :users_id, null: false
      t.string :provider, :uid, null: false

      t.timestamps null: false
    end

    add_index :authentications, [:provider, :uid]


    add_column :users, :remember_me_token, :string, default: nil
    add_column :users, :remember_me_token_expires_at, :datetime, default: nil

    add_index :users, :remember_me_token


    add_column :users, :reset_password_token, :string, default: nil
    add_column :users, :reset_password_token_expires_at, :datetime, default: nil
    add_column :users, :reset_password_email_sent_at, :datetime, default: nil
    add_column :users, :access_count_to_reset_password_page, :integer, default: 0

    add_index :users, :reset_password_token


    add_column :users, :activation_state, :string, default: nil
    add_column :users, :activation_token, :string, default: nil
    add_column :users, :activation_token_expires_at, :datetime, default: nil

    add_index :users, :activation_token
  end
end
