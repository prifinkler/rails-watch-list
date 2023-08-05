class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, uniqueness: true, presence: true
end

# A movie has many bookmarks
# You can’t delete a movie if it is referenced in at least one bookmark.

# A movie must have a unique title and an overview.
