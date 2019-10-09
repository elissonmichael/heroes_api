Rails.application.routes.draw do
  namespace :v1 do
    defaults format: :json do
      resources :characters
    end
  end
end
