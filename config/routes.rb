CpaMagic::Application.routes.draw do
  root :to => 'sections#index'

  resources :states
  
  get '/sections/:code' => 'sections#show'
  resources :sections
  
  get '/exam-information' => 'info#exam_information'
  get '/sandbox' => 'info#sandbox'
  
  get '/user_test' => 'user_tests#show'
  post '/user_test' => 'user_tests#create'
  
  post '/signin' => 'sessions#create'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'

  resources :users
end
