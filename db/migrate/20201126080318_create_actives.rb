class CreateActives < ActiveRecord::Migration[6.0]
  def change
    create_table :actives do |t|
      t.text :way_1,  null: false
      t.text :way_2,  null: false
      t.text :way_3,  null: false
      t.references :user ,foreign_key: true 
      t.references :prep ,foreign_key: true 
      t.references :task ,foreign_key: true 
      t.timestamps
    end
  end
end
