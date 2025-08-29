class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.references :sport, null: false, foreign_key: true
      t.string :location
      t.datetime :event_time
      t.integer :players_needed
      t.text :description

      t.timestamps
    end
  end
end
