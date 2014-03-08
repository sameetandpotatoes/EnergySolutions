class ContentsController < ApplicationController
	include ApplicationHelper
	caches_page :biomass, :hydroelectric, :wind, :solar, :geothermal, :biofuel, :about, :home
	def home
	end
	def biomass
	end
	def hydroelectric
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
	def robots
		robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
		render :text => robots, :layout => false, :content_type => "text/plain"
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
		@water= goodForWater(@state.to_s)
		@energy = {Wind: @wind, Solar: @solar, Biomass: @biomass, Geothermal: @geo, Hydroelectric: @water}
		@state = us_states(@state.to_s)
		@state = @state.strip
	end
end
