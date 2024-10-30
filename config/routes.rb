Rails.application.routes.draw do
    resources :lists, only: [:index, :new, :create, :edit, :update, :destroy]

    resources :lists do
        resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
    end

    resources :tasks, only: [:index, :edit, :destroy]

end
