# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "available_seats#new"
  resources :available_seats, only: [:new, :create]
end
