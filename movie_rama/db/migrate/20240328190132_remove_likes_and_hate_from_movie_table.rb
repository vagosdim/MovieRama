class RemoveLikesAndHateFromMovieTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :likes, :integer
    remove_column :movies, :hates, :integer
  end
end
