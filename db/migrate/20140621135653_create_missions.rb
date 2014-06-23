class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :title
      t.text :details
      t.boolean :done
      t.references :user
      t.timestamps
    end
  end
end
