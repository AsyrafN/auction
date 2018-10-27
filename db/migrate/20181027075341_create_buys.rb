class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :buys do |t|
   	  t.belongs_to :user
   	  t.belongs_to :product
   	  t.string :product_bought

      t.timestamps
    end
  end
end
