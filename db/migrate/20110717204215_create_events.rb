class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :url
      t.text :description
      t.references :city
      t.timestamp :start_at
      t.timestamp :stop_at

      t.timestamps
    end
    change_table :events do |t|
      t.index :city_id
    end
  end
end
