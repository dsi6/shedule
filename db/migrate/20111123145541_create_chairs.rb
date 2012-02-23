class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.integer :chnum
      t.string :chname

      t.timestamps
    end
  end
end
