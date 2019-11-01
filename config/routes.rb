Rails.application.routes.draw do
  namespace :v1 do
    defaults format: :json do
      resources :characters do
        resources :skills, except: [:index, :show] 
      end
    end
  end
end
