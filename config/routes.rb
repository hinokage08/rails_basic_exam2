Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:create, :destroy]

  resources :sessions, only: [:new, :create, :destroy]
  
  resources :users do
    collection do
      post :confirm
    end
  end

  resources :websites do
    collection do
      post :confirm
    end
  end
end
