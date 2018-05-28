class AddRatingsAndCommentsToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :ratings, :string
    add_column :routes, :userRating, :string
    add_column :routes, :comments, :string
  end
end
