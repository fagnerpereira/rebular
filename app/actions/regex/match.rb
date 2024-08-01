# frozen_string_literal: true
require 'pry'
module Rebular
  module Actions
    module Regex
      class Match < Rebular::Action
        include Deps[
          home_view: 'views.home.index'
        ]
        def handle(request, response)
          # binding.pry
          response.render(home_view, match_result: 'Hello World')
        end
      end
    end
  end
end
