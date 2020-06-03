Rails.application.routes.draw do
  resources :departamentos
	#delete "produtos/:id", to: "produtos#destroy", as: :produto
	#post "produtos", to: "produtos#create"
	#get "produtos/new", to: "produtos#new"
	get "produto/busca", to: "produtos#busca", as: :busca_produto
	resources :produtos, only: [:new, :create, :destroy, :edit, :update]
	root to: "produtos#index"
end