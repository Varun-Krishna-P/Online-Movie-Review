class LanguagesController < ApplicationController
	def show
		@language = Language.find(params[:id])
	end
	def index
		@languages = Language.all
	end
	def create
		#render :text => params[:language].inspect
		@language = Language.create(params[:language])
		if(@language.save)
			redirect_to(@language, :notice => "Language saved successfull")
		else
			redirect_to(new_language_path,:alert => "Language saved failed")
		end
	end

	def destroy
		@language = Language.find(params[:id]).destroy
		redirect_to(@language,:notice => "Language deleted successfully")
		
	end
end
