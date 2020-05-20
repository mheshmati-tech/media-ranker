class Work < ApplicationRecord
  def self.spotlight
    return Work.all.sort_by { |media| media.votes.count }.reverse.first
  end

  def self.albums
    return Work.where(category: "album").sort_by { |album| album.votes.count }.reverse
  end

  def self.books
    return Work.where(category: "book").sort_by { |movie| movie.votes.count }.reverse
  end

  def self.movies
    return Work.where(category: "movie").sort_by { |book| book.votes.count }.reverse
  end

  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, numericality: { only_integer: true, greater_than: 1000 }
  validates :description, presence: true

  has_many :votes
  has_many :users, through: :votes
end
