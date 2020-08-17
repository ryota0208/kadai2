Rails.application.routes.draw do
	root :to => 'books#top'
  get 'books/new'
  get 'books' =>'books#index'
  	post 'books' => 'books#create'
    get 'books/:id' => 'books#show', as: 'book'
    get 'books/:id/edit' => 'books#edit', as: 'edit_book'
    patch 'books/:id' => 'books#update', as: 'update_book'
    put 'books/:id' => 'books#update'
    delete 'books/:id' => 'books#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end