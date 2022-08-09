class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.integer :category_id 
      t.string :description
      t.string :image
      t.string :name
      t.string :cooking_effect
      t.integer :hearts_recovered
      t.integer :attack
      t.integer :defense
      t.string :drops
      t.boolean :logged
    end
  end
end
