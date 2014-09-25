class MoviesController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_movie, only: [:update, :destroy]
  def find_movie
    @movie = current_user.movies.find_by_id(params[:id])
    
  end

  def index
  	@movies = Movie.all
  end
  def new
  	@movie = Movie.new
  end

  def create
  	#render :text => params[:movie].inspect    
    @movie = Movie.create(params[:movie]) 
    #assigns the current userId to the movie's userid.
    @movie.user_id = current_user.id 	
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
  	#if @movie
     # redirect_to(movies_path,:notice => "Movie edited successfully") 
    #else
     # redirect_to(movies_path, :alert => "You can only edit the post created by you !")
    #end     
  end
  def update   
    if @movie
      redirect_to(movies_path,:notice => "Movie updated successfully")     
    else
       redirect_to(movies_path, :alert => "You can only update the post created by you !")
    end
    
  end
  def destroy   
    if  @movie
      @movie.destroy
      redirect_to(movies_path,:notice => "Movie deleted successfully")     
    else
      redirect_to(movies_path, :alert => "You can only delete the post created by you !")
    end
    
  end

  def show
    @movie = Movie.find(params[:id])
    
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @movie= Movie.find(params[:id])
    @movie.add_or_update_evaluation(:votes,value,current_user)
    redirect_to :back, :notice => "Thanks for voting!!!"
    
  end
end
