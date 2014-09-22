class MoviesController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@movies = Movie.all
  end
  def new
  	@movie = Movie.new
  end

  def create
  	#render :text => params[:movie].inspect
    @movie = Movie.create(params[:movie])  	
    #@movie.new(params[:movie])
    #@movie.save
    if(@movie.save)
      redirect_to(movies_path, :notice => "Movie saved successfully!")
    else
      redirect_to(new_movie_path, :alert => "Movie save failed!")
    end
  end
  def edit
  	@movie = Movie.find(params[:id])
  end
end
