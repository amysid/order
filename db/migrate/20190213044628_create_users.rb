class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.integer :role
      t.string :authentication_token
      t.integer :blocked , default: 0
      t.datetime :authentication_timeout

      t.timestamps
    end
  end
end
