class AddPresentationUrlsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :player_1_presentation_url, :string
    add_column :matches, :player_2_presentation_url, :string
  end
end
