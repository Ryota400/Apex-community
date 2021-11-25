class AddMovieToClips < ActiveRecord::Migration[5.2]
  def change
    add_column :clips, :movie, :string
  end
end
