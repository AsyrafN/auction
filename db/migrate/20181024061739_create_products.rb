class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string :name
      t.integer :original_price
      t.integer :current_price
      t.text :description
      t.datetime :end_time
      t.boolean :sold, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
