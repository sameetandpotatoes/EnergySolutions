class ContentsController < ApplicationController
	def home

	end
	def water

	end
	def wind

	end
	def solar

	end
	def geothermal

	end
	def about

	end
	def contact

	end
	def search
		@query = ""
		if params[:search] != ""
			@search = Content.advanced_search(params[:search].split(" ").join("|")).basic_search(params[:search])
			@query = params[:search]
			@contents = @search
		elsif params[:search] = ""
			@contents = Content.all
		end
	end
end
