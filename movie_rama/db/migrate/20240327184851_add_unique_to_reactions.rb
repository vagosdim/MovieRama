class AddUniqueToReactions < ActiveRecord::Migration[7.1]
  def change
    add_index :reactions, [:user_id, :movie_id], unique: true
  end
end
