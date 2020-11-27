class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :rev_1,  null: false
      t.text :rev_2,  null: false
      t.text :rev_3,  null: false
      t.text :rev_4,  null: false
      t.references :user ,foreign_key: true 
      t.references :prep ,foreign_key: true 
      t.references :task ,foreign_key: true 
      t.references :active ,foreign_key: true 
      t.timestamps
    end
  end
end
