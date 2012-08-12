CpaMagic::Application.routes.draw do
  resources :states

  resources :categories

  root :to => 'sections#index'
  resources :sections
  get '/exam-information' => 'info#exam_information'
end
