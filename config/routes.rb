Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get 'static_pages/home'
  
  get 'currencies/exchange'
  get 'currencies/archival_exchange'
  get 'currencies/converter'

end
