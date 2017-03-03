Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root "welcome#welcome"

  resources :subscriptions, only: [:new, :create]
  resources :shared_messages, only: [:new, :create]
  get "share_success" => "shared_messages#share_success"

  post "twilio" => "twilio#incoming_message"

  get "success" => "subscriptions#success"
  get "unsubscribed" => "subscriptions#unsubscribed"
  get "edit" => "subscriptions#edit"
  put "subscriptions/unsubscribe" =>"subscriptions#unsubscribe"
end
