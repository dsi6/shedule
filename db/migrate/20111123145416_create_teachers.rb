class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :sname
      t.string :last_name
      t.string :tlogin
      t.string :scrank

      t.timestamps
    end
  end
end
