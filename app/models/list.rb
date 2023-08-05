class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
end

# A list has many bookmarks
# A list has many movies through bookmarks

# A list must have a unique name.
# When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).
