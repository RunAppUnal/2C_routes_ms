class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.integer :user_id
      t.integer :car_id
      t.string :title
      t.string :description
      t.float :from_lat
      t.float :from_lng
      t.float :to_lat
      t.float :to_lng
      t.string :waypoints
      t.datetime :departure
      t.float :cost
      t.string :users_in_route
      t.boolean :active
      t.integer :spaces_available

      t.timestamps
    end
  end
end
