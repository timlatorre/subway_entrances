SubwayEntrances::Application.routes.draw do

  get '/' => 'home#index'
  post '/populate' => 'home#create'
  get '/entrances' => 'home#show'
  post '/search' => 'home#search'

end
