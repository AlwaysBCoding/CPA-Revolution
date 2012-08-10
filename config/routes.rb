CpaMagic::Application.routes.draw do
  resources :categories

  root :to => 'sections#index'
  resources :sections
end
