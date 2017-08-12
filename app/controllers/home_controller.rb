class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@occurrence = Occurrence.new
		count_occurences = ActiveRecord::Base.connection.execute(
			"SELECT COUNT(occurrences.id), users.id, users.name
			FROM occurrences
			INNER JOIN users on occurrences.user_id = users.id
			GROUP BY users.id, users.name
			ORDER BY COUNT(occurrences.id) DESC
			LIMIT 3"
		)

		@count_occurences = count_occurences		
		@occurrences = Occurrence.all
	end

	def create_occurrence
		@occurrence = Occurrence.new(occurrence_params)
		@occurrence.save
	end

	def getAllOccurrences
		@occurrences = Occurrence.all
	end


	def getById
		@occurrence = Occurrence.find_by_id(params[:id])
		render json: @occurrence
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
