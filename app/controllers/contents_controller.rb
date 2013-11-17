class ContentsController < ApplicationController
	def home

	end
	def biomass

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
	end
	def results
		@location = params[:myLoc]
	end
end
