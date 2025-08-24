class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :encrypted_password, null: false
      t.string :address
      t.string :phone_number
      t.references :favorite_sport, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
