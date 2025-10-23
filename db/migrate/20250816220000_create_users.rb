class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string  :name,            null: false
      t.string  :email,           null: false
      t.string :password_digest, null: false
      t.string  :address
      t.string  :phone_number
      t.references :favorite_sport, null: true, foreign_key: { to_table: :sports, on_delete: :nullify }
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
