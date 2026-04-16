Rails.application.routes.draw do

  namespace :admin do
    get "dashboard" => "dashboard#show"
    resources :settings
    get "setting/index"
  end
  devise_for :users
  get "pages/home"
  get "pages/services"
  get "pages/work"
  get "pages/process"
  get "pages/about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "pages#home"
  get "services" => "pages#services"
  get "work" => "pages#work"
  get "process" => "pages#methodology"
  get "about" => "pages#about"
  get "projects/:id" => "pages#project_detail", as: :project
end
