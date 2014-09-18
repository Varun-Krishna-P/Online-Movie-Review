class GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
	end
	def index
	end
	def create
		@genre = Genre.create(params[:genre])
		if(@genre.save)
			redirect_to(@genre, :notice => "Genre Saved successfully")
		else
			redirect_to(new_genre_path, :alert => "genre not saved")
		end
		#render :text => params[:genre].inspect
	end
end
