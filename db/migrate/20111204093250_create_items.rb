class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :flow_id
      t.integer :room_id
      t.integer :itype
      t.integer :inum
      t.integer :wday
      t.date :start_at
      t.date :finish_at

      t.timestamps
    end
  end
end
