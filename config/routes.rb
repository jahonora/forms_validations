Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sales/new'
  get 'sales', to: 'sales#index'
  post 'sales', to: 'sales#create'
  get 'sales/:id', to: 'sales#done', as: 'sales_done'
  get 'sales/:id', to: 'sales#show', as: 'sale'
end


  #get 'posts/new'
  #post 'posts', to: 'posts#create'
  #get 'posts/:id', to: 'posts#show', as: 'post'