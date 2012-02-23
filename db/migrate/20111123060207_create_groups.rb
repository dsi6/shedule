class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.text :numb_gr
      t.integer :gcount
      t.integer :plan_id
      t.integer :semester_id
      t.integer :faculty_id

      t.timestamps
    end
  end
end
