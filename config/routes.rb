# frozen_string_literal: true

module Rebular
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    get "/home", to: "home.index"
    get "/home/:id", to: "home.show"
    get "/home/:id", to: "home.show"
  end
end
