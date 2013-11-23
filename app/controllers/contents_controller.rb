class ContentsController < ApplicationController
	include ApplicationHelper
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
		@state = params[:state]
		@city = params[:city]
		@lat = params[:lat]
		@long = params[:long]
		@state = @state.titlecase
		@state = us_states(@state.to_s)
		@state = @state.strip
		#http://www.dsireusa.org/incentives/index.cfm?re=0&ee=0&spv=0&st=0&srp=1&state=CA
	end
end
