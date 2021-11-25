class AddBestMovieToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :best_movie, :string
  end
end
