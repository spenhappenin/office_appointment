Rails.application.routes.draw do
  get 'static_pages/about'

	root 'doctors#index'

  resources :doctors
  resources :patients
  resources  :appointments
end
