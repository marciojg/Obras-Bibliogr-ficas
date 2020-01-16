# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      with_options only: %i[index] do
        resources :authors
      end
    end
  end
end
