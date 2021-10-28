class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :display_name
      t.string :profile_url
      t.string :email,                  null: false
      t.string :password_hash,          null: false
      t.integer :credits,               default: 0
      t.boolean :account_verified,      default: false, null: false
      t.datetime :account_verified_at

      t.timestamps
    end
  end
end
