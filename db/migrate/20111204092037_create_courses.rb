class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :sname
      t.integer :plan_id
      t.integer :fotch
      t.integer :lab
      t.integer :sem
      t.integer :lect
      t.integer :chair_id
      t.integer :cfaculty
      t.integer :mywork

      t.timestamps
    end
  end
end
