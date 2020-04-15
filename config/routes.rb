Rails.application.routes.draw do
	get "produtos/:id/remover", to: "produtos#destroy"
	post "produtos", to: "produtos#create"
	get "produtos/new", to: "produtos#new"
	root to: "produtos#index"
end