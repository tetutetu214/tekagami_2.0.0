class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :task_1,  null: false
      t.text :task_2,  null: false
      t.text :task_3,  null: false
      t.references :user ,foreign_key: true 
      t.references :prep ,foreign_key: true 
      t.timestamps
    end
  end
end
