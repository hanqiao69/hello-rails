class PuppiesController < ApplicationController
	respond_to :html
	before_action :find_puppy, except: [:index, :new, :create]

	def index
		@puppies = Puppy.all
	end

	def show
	end

	def new
		@puppy = Puppy.new
		respond_with @puppy
	end

	def create
		@puppy = Puppy.create(puppy_params)
		respond_with @puppy
	end

	def edit
	end

	def update
		@puppy.update(puppy_params)
		respond_with @puppy
	end

	def destroy
		@puppy.destroy
		respond_with @puppy
	end

	private

	def puppy_params
		params.require(:puppy).permit(:owner, :color, :description)
	end

	def find_puppy
		@puppy = Puppy.find(params[:id])
	end

end
