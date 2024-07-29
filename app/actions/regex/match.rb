# frozen_string_literal: true
require 'pry'
module Rebular
  module Actions
    module Regex
      class Match < Rebular::Action
        def handle(request, response)
          binding.pry
          response.render(view, match_result: 'Hello World')
        end
      end
    end
  end
end
