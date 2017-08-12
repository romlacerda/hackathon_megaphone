class Occurrence < ApplicationRecord
	has_many :photo_occurrences
	has_many :votes
	belongs_to :user
	belongs_to :type
	accepts_nested_attributes_for :votes,  allow_destroy: true
	accepts_nested_attributes_for :photo_occurrences, allow_destroy: true

	
end

