HomeOwner::Application.routes.draw do
  root 'contents#home', as: 'home'
  get 'biomass', to: 'contents#biomass', as: 'biomass'
  get 'hydroelectric', to: 'contents#hydroelectric', as: 'hydroelectric'
  get 'wind', to: 'contents#wind', as: 'wind'
  get 'solar', to: 'contents#solar', as: 'solar'
  get 'geothermal', to: 'contents#geothermal', as: 'geothermal'
  get 'biofuel', to: 'contents#biofuel', as: 'biofuel'
  get 'sources', to: 'contents#sources', as: 'sources'
  get 'compare', to: 'contents#compare', as: 'compare'
  get 'all', to: 'contents#all', as: 'all'
  get 'view' => 'contents#results', :via => :post, as: 'results'
  get 'about', to: 'contents#about'
  get '/robots.txt' => 'contents#robots'
end

