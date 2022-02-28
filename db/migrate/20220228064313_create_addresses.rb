class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string         :postal_code,      null: false
      t.string         :postal_code,      null: false
      t.string         :postal_code,      null: false
      t.string         :postal_code,      null: false
      t.string         :postal_code,      null: false

      
      
      
      
      t.timestamps
    end
  end
end
