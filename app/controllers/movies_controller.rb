class MoviesController < ApplicationController
	before_filter :authenticate_user!
  def index
  	#@movies = Movie.all
  end
  def new
  	#@movie = Movie.new
  end

  def create
  	render :text => params[:movie].inspect  	
  end
  def edit
  	@movie = Movie.find(params[:id])
  end
end
