class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.float :lon
      t.float :lat
      t.text :number
      t.text :street
      t.text :unit
      t.text :city
      t.text :district
      t.text :region
      t.text :postcode
      t.text :id
      t.text :hash
    end
  end
end
