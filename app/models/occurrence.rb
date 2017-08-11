class Occurrence < ApplicationRecord
	has_many :photo_occurrences
	has_many :votes
end

