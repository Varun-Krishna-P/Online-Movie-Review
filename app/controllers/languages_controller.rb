class LanguagesController < ApplicationController
	def show
		
	end
	def index
		
	end
	def create
		render :text => params[:language].inspect
	end
end
