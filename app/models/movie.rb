class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, uniqueness: true, presence: true

  validates :vote_average, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :vote_count, presence: true, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end

# A movie has many bookmarks
# You can’t delete a movie if it is referenced in at least one bookmark.

# A movie must have a unique title and an overview.
