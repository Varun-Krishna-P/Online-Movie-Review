class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :user
      t.references :genre
      t.references :language
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :movies, :user_id
    add_index :movies, :genre_id
    add_index :movies, :language_id
  end
end
