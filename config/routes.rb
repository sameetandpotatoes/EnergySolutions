HomeOwner::Application.routes.draw do
  root 'contents#home'
  get 'water', to: 'contents#water'
  get 'wind', to: 'contents#wind'
  get 'solar', to: 'contents#solar'
  get 'geothermal', to: 'contents#geothermal'
  get 'about', to: 'contents#about'
  get 'contact', to: 'contents#contact'
  get 'compare', to: 'contents#compare'
  get 'search' => 'contents#search'
end
