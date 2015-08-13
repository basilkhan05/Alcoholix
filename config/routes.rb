Rails.application.routes.draw do
  
  root 'pages#home'   #rooot route is set to home page
  
  get '/home', to: 'pages#home'

end
