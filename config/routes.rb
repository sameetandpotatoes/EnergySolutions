HomeOwner::Application.routes.draw do
  root 'contents#home', as: 'home'
  get 'biomass', to: 'contents#biomass', as: 'biomass'
  get 'water', to: 'contents#water', as: 'water'
  get 'wind', to: 'contents#wind', as: 'wind'
  get 'solar', to: 'contents#solar', as: 'solar'
  get 'geothermal', to: 'contents#geothermal', as: 'geothermal'
  get 'biofuel', to: 'contents#biofuel', as: 'biofuel'
  get 'sources', to: 'contents#sources', as: 'sources'
  get 'compare', to: 'contents#compare', as: 'compare'
  get 'view' => 'contents#results', :via => :post, as: 'results'

  get '/robots.txt' => 'contents#robots'
end
