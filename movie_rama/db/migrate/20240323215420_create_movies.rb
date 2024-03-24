class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.date :upload_date
      t.integer :likes, default: 0
      t.integer :hates, default: 0

      t.timestamps
    end
  end
end
