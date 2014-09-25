class LanguagesController < ApplicationController
	before_filter :authenticate_user!
	def show
		@language = Language.find(params[:id])
	end
	def index
		@search = Language.search(params[:q])
		@languages = @search.result
	end
	def create
		#render :text => params[:language].inspect
		@language = Language.create(params[:language])
		if(@language.save)
			redirect_to(languages_path, :notice => "Language saved successfull")
		else
			redirect_to(new_language_path,:alert => "Language saved failed")
		end
	end
	def edit
		@language = Language.find(params[:id])
	end

	def update
		@language = Language.find(params[:id])
		if(@language.update_attributes(params[:language]))
			redirect_to(@language,:notice =>"Genre successfully updated")
		else
			redirect_to(edit_language_path)
		end
		
	end

	def destroy
		@language = Language.find(params[:id]).destroy
		redirect_to(@language,:notice => "Language deleted successfully")
		
	end

	def new
		@language = Language.new
	end
end
