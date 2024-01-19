class UpdateMoviesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :rating
    add_column :movies, :vote_average, :decimal
    add_column :movies, :vote_count, :integer
  end
end
