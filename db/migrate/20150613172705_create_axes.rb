class CreateAxes < ActiveRecord::Migration
  def change
    create_table :axes do |t|
      t.references :axis
      t.references :type

      t.string :name
      t.string :details

      t.belongs_to :user

      t.timestamps
    end
  end
end
