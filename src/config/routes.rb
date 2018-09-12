Rails.application.routes.draw do
  get '/', to: 'home#show'
  get '/address/', to: 'address#show'
end
