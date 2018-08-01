Rails.application.routes.draw do
  root to: 'landing_pages#show'
  get 'f/complete', to: 'forms#complete', as: 'form_complete'
  get 'f(/:step)', to: 'forms#show', as: 'form'
  post 'fs/:step', to: 'forms#submit', as: 'form_submit'
  get '/privacy-policy', to: 'landing_pages#privacy_policy'
end
