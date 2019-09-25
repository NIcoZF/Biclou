# frozen_string_literal: true

Rails.application.routes.draw do

  root 'home#index'
  get '/fetch', to: 'fetches#index'
end
