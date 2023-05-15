class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :eamil
      t.string :username
      t.integer :gender
      t.integer :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
