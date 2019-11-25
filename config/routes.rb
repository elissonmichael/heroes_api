Rails.application.routes.draw do
  namespace :v1 do
    defaults format: :json do
      resources :characters do
        resources :skills, except: [:index, :show]
      end
      root 'characters#index'
    end
  end
  defaults format: :json do
    root 'v1/characters#index'
  end
end
