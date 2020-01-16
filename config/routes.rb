# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  get '/authors', to: 'authors#index', constraints: { format: 'json' }
end
