class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id, message: 'is already in the list' }
  validates :comment, length: { minimum: 6 }, presence: true
end


# A bookmark belongs to a movie
# A bookmark belongs to a list

# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.
