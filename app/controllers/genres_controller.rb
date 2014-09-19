class GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
	end
	def index
		@genres = Genre.all
	end
	def create
		@genre = Genre.create(params[:genre])
		if(@genre.save)
			redirect_to(genres_path, :notice => "Genre Saved successfully")
		else
			redirect_to(new_genre_path, :alert => "genre not saved")
		end
		#render :text => params[:genre].inspect
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if(@genre.update)
			redirect_to(@genre,:notice =>"Genre successfully updated")
		else
			redirect_to(edit_genre_path)
		end
	end
	def destroy
		#@genre = Genre.find([params[:id]]).destroy
		@genre = Genre.find(params[:id])
		@genre.destroy
		#or
		#@genre = Genre.find(params[:id]).destroy
		redirect_to(genres_path,:notice => "Genre deleted successfully")
		
	end
end
