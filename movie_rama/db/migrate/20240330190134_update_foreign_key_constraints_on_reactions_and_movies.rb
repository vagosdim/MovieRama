class UpdateForeignKeyConstraintsOnReactionsAndMovies < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :movies, :users
    remove_foreign_key :reactions, :movies
    remove_foreign_key :reactions, :users

    add_foreign_key :movies, :users, on_delete: :cascade
    add_foreign_key :reactions, :users, on_delete: :cascade
    add_foreign_key :reactions, :movies, on_delete: :cascade
  end
end
