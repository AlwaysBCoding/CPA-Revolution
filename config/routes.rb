CpaMagic::Application.routes.draw do
  root :to => 'info#index'

  resources :states
  
  get '/sections/:code' => 'sections#show'
  resources :sections
  
  get '/exam-information' => 'info#exam_information'
  get '/sandbox' => 'info#sandbox'
  get '/contact' => 'info#contact'
  get '/videos' => 'info#videos'
  
  get '/user_test' => 'user_tests#show'
  get '/user_test/finish' => 'user_tests#finish'
  post '/user_test' => 'user_tests#create'
  post '/user_test/:question_number' => 'user_tests#update'
  
  post '/signin' => 'sessions#create'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'

  resources :users
end
