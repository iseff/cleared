Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  get 'admin', to: 'admin#index', as: 'admin'
  post 'admin', to: 'admin#index', as: 'admin_update'
  get 'admin/template/:id', to: 'admin#template', as: 'admin_template'
  post 'admin/template/:id', to: 'admin#template', as: 'admin_update_template'
  get 'admin/form', to: 'admin#form', as: 'admin_form'
  root to: 'landing_pages#show'
  get 'f/complete', to: 'forms#complete', as: 'form_complete'
  get 'f(/:step)', to: 'forms#show', as: 'form'
  post 'fs/:step', to: 'forms#submit', as: 'form_submit'
  get '/privacy-policy', to: 'landing_pages#privacy_policy'
end
