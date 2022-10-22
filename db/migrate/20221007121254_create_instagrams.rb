class CreateInstagrams < ActiveRecord::Migration[6.1]
  def change
    create_table :instagrams do |t|
      t.text :body
      t.integer :user_id
      t.string :image
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
