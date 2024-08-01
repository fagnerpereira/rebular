# frozen_string_literal: true

module Rebular
  module Actions
    module Home
      class Index < Rebular::Action
        def handle(request, response)
          response.render(view, match_result: '')
        end
      end
    end
  end
end
