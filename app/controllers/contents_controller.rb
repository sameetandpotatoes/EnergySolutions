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
	def biofuel
	end
	def sources
	end
	def about
	end
	def robots

	end
	def results
		@state = params[:state]
		@city = params[:city]
		@lat = params[:lat]
		@long = params[:long]
		@state = @state.titlecase

		#Determining best energy sources
		@wind= goodForWind(@state.to_s)
		@solar= goodForSolar(@state.to_s)
		@biomass= goodForBiomass(@state.to_s)
		@geo= goodForGeo(@state.to_s)

		@state = us_states(@state.to_s)
		@state = @state.strip
	end
end
