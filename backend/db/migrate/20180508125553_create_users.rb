class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: :false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
