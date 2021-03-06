class SuggestionsController < ApplicationController
	respond_to :html
	before_action :find_puppy

	def create
		@puppy = Puppy.find(params[:puppy_id])
		@puppy.suggestions.create(suggestion_params)
		respond_with @suggestion, location: puppy_url(@puppy)
	end

	def edit
	end

	def show
	end


	private

	def suggestion_params
		params.require(:suggestion).permit(:name)
	end

	def find_puppy
		@puppy = Puppy.find(params[:id])
	end

end
