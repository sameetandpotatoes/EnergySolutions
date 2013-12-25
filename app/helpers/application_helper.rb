module ApplicationHelper
	def us_states(state)
		hash = { "Alabama" => "AL",
			"Alaska" => "AK",
			"Arizona" => "AZ",
			"Arkansas" => "AR",
			"California" => "CA",
			"Colorado" => "CO",
			"Connecticut" => "CT",
			"Delaware" => "DE",
			"District of Columbia" => "DC",
			"Florida" => "FL",
			"Georgia" => "GA",
			"Hawaii" => "HI",
			"Idaho" => "ID",
			"Illinois" => "IL",
			"Indiana" => "IN",
			"Iowa" => "IA",
			"Kansas" => "KS",
			"Kentucky" => "KY",
			"Louisiana" => "LA",
			"Maine" => "ME",
			"Maryland" => "MD",
			"Massachusetts" => "MA",
			"Michigan" => "MI",
			"Minnesota" => "MN",
			"Mississippi" => "MS",
			"Missouri" => "MO",
			"Montana" => "MT",
			"Nebraska" => "NE",
			"Nevada" => "NV",
			"New Hampshire" => "NH",
			"New Jersey" => "NJ",
			"New Mexico" => "NM",
			"New York" => "NY",
			"North Carolina" => "NC",
			"North Dakota" => "ND",
			"Ohio" => "OH",
			"Oklahoma" => "OK",
			"Oregon" => "OR",
			"Pennsylvania" => "PA",
			"Puerto Rico" => "PR",
			"Rhode Island" => "RI",
			"South Carolina" => "SC",
			"South Dakota" => "SD",
			"Tennessee" => "TN",
			"Texas" => "TX",
			"Utah" => "UT",
			"Vermont" => "VT",
			"Virginia" => "VA",
			"Washington" => "WA",
			"West Virginia" => "WV",
			"Wisconsin" => "WI",
			"Wyoming" => "WY"
		}
		hash[state]
	end
	def goodForWind(state)
		good_states=["Iowa","California","Illinois","Minnesota","Montana","North Dakota","South Dakota","Wyoming","Nebraska","Kansas","Oklahoma","Missouri","New Mexico","Alaska"]
		good_states.include?(state)
	end
	def goodForSolar(state)
		good_states=["Michigan","Texas","California","Colorado","Tennessee","Wisconsin","Minnesota","Florida","Pennsylvania","Oregon","Utah","Washington","Arizona"]
		good_states.include?(state)
	end
	def goodForBiomass(state)
		good_states=["California","Washington","Oregon","Minnesota","Iowa","Nebraska","Kansas","Texas","Arkansas","Louisiana","Mississippi","Georgia","Illinois","Indiana","Ohio"]
		good_states.include?(state)
	end
	def goodForGeo(state)
		good_states=["Oregon","Idaho","Wyoming","Colorado","New Mexico","Arizona","California","Nevada","Utah"]
		good_states.include?(state)
	end
	def goodForWater(state)
		good_states=["Washington","Oregon","California","Colorado","Nevada","Maine","New York","North Carolina","South Carolina","Virginia","Pennsylvania","Connecticut"]
		good_states.include?(state)
	end
end
