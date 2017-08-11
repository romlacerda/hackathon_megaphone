class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@occurrence = Occurrence.new
	end

	def create_occurrence(occurrence)
		@occurrence = new Occurrence(occurrence)
		@occurrence.save
	end




	private
		def occurrence_params
	      params.require(:occurrence).permit(
	        :data_begin, :status, :description, :user_id, :latitude, :longitude, :date_end,
	        :votes_attributes => [:id, :vote, :_destroy],
	        :photo_occurrences_attributes => [:id, :photo, :_destroy]
	      )
	    end
end
