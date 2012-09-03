CpaMagic::Application.routes.draw do
  root :to => 'sections#index'

  resources :states
  
  get '/sections/:code' => 'sections#show'
  resources :sections
  
  get '/exam-information' => 'info#exam_information'
  get '/sandbox' => 'info#sandbox'
  get '/contact' => 'info#contact'
  get '/videos' => 'info#videos'

  get '/user_test' => 'user_tests#show'
  get '/user_test/finish' => 'user_tests#finish', :as => "finish"
  post '/user_test' => 'user_tests#create'
  post '/user_test/:question_number' => 'user_tests#update'
  put '/user_test' => 'user_tests#store_time'
  
  post '/signin' => 'sessions#create'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'

  resources :users
  post '/users/:id' => 'users#scoredate', :as => 'user'
  
  get '/sandbox/bonds' => 'info#bonds', :as => 'sandbox_bond'
  get '/sandbox/stock' => 'info#stock', :as => 'sandbox_stock'
end
