Rails.application.routes.draw do
    resources :lists do
        resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
    end

    get 'search', to: 'search#index', as: 'search'
end
