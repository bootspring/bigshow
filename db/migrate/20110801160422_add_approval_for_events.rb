class AddApprovalForEvents < ActiveRecord::Migration
  def up
    change_table :events do |t|
      t.timestamp :approved_at
    end
  end

  def down
    change_table :events do |t|
      t.remove :approved_at
    end
  end
end
