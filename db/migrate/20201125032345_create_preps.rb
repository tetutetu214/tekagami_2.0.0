class CreatePreps < ActiveRecord::Migration[6.0]
  def change
    create_table :preps do |t|
      t.text :now,  null: false
      t.text :target,    null: false
      t.references :user ,foreign_key: true 
      t.timestamps
    end
  end
end
