class AddLocationToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :location, :string
  end
end
