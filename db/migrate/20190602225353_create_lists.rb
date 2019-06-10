class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.datetime :completed_at
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
