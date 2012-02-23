class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :short_name
      t.string :name

      t.timestamps
    end
  end
end
