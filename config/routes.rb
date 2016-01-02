Rails.application.routes.draw do
  scope '(:locale)', locale: /en|cn/ do
    # root :to => 'documents#index'
    resources :documents
  end
  resources :documents

  root :to => 'documents#index'
end
