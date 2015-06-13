class CreateAxes < ActiveRecord::Migration
  def change
    create_table :axes do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
