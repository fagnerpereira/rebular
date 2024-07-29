# frozen_string_literal: true

module Rebular
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    get '/home', to: 'home.index'
    post '/regex/match', to: 'regex.match'
    get '/regex/match', to: 'regex.match'
  end
end
