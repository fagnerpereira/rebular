require 'pry'

module Rebular
  module Views
    module Regex
      class Match < Rebular::View
        expose :match_result do |match_result:|
          binding.pry
        end
      end
    end
  end
end
