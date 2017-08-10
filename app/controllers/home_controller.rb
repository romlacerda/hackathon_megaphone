class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@occurrences = Occurrence.all
	end

	def create_occurrence(occurrence)
		@occurrence = new Occurrence(occurrence)
		@occurrence.save
	end
end
