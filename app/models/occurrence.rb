class Occurrence < ApplicationRecord
	has_many :photo_occurrences
	has_many :votes
	belongs_to :user
	accepts_nested_attributes_for :votes, :photo_occurrences, :user, allow_destroy: true

end

