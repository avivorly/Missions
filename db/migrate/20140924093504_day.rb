class Day < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      t.text :brief
      t.text :grades
      t.references :user

      t.timestamps
    end
  end
end
