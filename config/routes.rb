Rails.application.routes.draw do
  resources :book_rentals, only: [] do
    collection do
      get 'mine' => 'book_rentals#mine'
    end
    member do
      delete 'return_book' => 'book_rentals#return_book'
    end
  end

  resources :books, only: [:index, :show] do
    member do
      post 'rent' => 'books#rent'
    end
  end
  resources :users, only: [:create, :show]
  post 'authenticate', to: 'authentication#authenticate'
end
