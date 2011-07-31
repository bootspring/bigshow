class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false, :limit => 64
      t.string :email, :limit => 64
      t.string :url, :null => false, :limit => 128
      t.references :city, :null => false
      t.date :start_at, :null => false
      t.date :stop_at, :null => false

      t.timestamps
    end
    change_table :events do |t|
      t.index :city_id
    end
  end
end
