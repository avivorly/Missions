class CreateAxisEvents < ActiveRecord::Migration
  def change
    create_table :axis_events do |t|
      t.integer :rank
      t.text :description
      t.belongs_to :axis

      t.timestamps
    end
  end
end
