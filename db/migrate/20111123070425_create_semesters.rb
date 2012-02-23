class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :year
      t.boolean :semnum
      t.integer :wcount
      t.date :stsem
      t.date :finsem

      t.timestamps
    end
  end
end
