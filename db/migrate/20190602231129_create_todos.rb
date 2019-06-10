class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.date :completed_at
      t.belongs_to :user, index: true
      t.belongs_to :list, index: true
      t.timestamps
    end
  end
end
