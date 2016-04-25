class Deck < ActiveRecord::Base
  validates :name, :presence => true
  validates :url, :format => {:with => URI::regexp(%w(http https)), :message => "must be a valid"}
  validates :url, :format => {:with => /docs\.google\.com/, :message => "must be a Google Docs URL"}

  def google_doc_id
    @google_doc_id ||= url.split("/d/").last.split("/").first.strip
  end
  
end
