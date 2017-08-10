class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@occurrences = Occurrence.all
	end

	def create_occurrence(occurrence)
		@occurrence = new Occurrence(occurrence)
		@occurrence.save
	end


	private
		def occurrence_params
	      params.require(:occurrence).permit(
	      	:data_begin, :status, :description, :user_id, :date_end, 
	      	:photo_occurrences_attributes =>[:id, :photo, :_destroy]
      		)
	    end
end
