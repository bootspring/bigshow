class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :null => false, :limit => 16
      t.string :title, :null => false, :limit => 32

      t.timestamps
    end

    add_index :cities, :name, :unique => true
  end
end
