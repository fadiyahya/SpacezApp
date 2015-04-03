class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :name
      t.string :officetype
      t.decimal :price
      t.text :aminities
      t.string :city
      t.text :location
      t.text :rules
      t.text :contacts

      t.timestamps null: false
    end
  end
end
