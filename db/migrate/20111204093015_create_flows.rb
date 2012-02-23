class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.integer :group_id
      t.text :comment

      t.timestamps
    end
  end
end
