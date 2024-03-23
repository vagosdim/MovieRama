class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.date :upload_date
      t.integer :likes
      t.integer :hates

      t.timestamps
    end
  end
end
