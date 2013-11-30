HomeOwner::Application.routes.draw do
  root 'contents#home'
  get 'biomass', to: 'contents#biomass'
  get 'water', to: 'contents#water'
  get 'wind', to: 'contents#wind'
  get 'solar', to: 'contents#solar'
  get 'geothermal', to: 'contents#geothermal'
  get 'biofuel', to: 'contents#biofuel'
  get 'about', to: 'contents#about'
  get 'contact', to: 'contents#contact'
  get 'compare', to: 'contents#compare'
  get 'search' => 'contents#search'
  get 'view' => 'contents#results', :via => :post
end
