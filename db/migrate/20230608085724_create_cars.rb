class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :email
      t.string :brand
      t.string :model
      t.string :car_number
      t.string :year_of_manufacture
      t.string :kms_driven
      t.string :price 
      t.string :any_damages 
      t.string :type_of_car 
      t.string :no_of_owners
      t.boolean :insured 
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
