Rails.application.routes.draw do
  root to: 'events#new'
  resources :events do
    get :time_form
    get :need_items
    get :need_things
    get :need_poeple_or_things
    get :preview_and_publish
  end
end
