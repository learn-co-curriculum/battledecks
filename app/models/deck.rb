class Deck < ActiveRecord::Base
  validates :name, :presence => true
  validates :url, :format => {:with => URI::regexp(%w(http https)), :message => "must be a valid"}
  validates :url, :format => {:with => /docs\.google\.com/, :message => "must be a Google Docs URL"}

  belongs_to :user

  def google_doc_id
    @google_doc_id ||= url.split("/d/").last.split("/").first.strip
  end

  def self.random(limit)
    limit(limit).order("RANDOM()")
  end
end
