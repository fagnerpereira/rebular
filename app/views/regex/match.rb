require 'pry'

module Rebular
  module Views
    module Regex
      class Match < Rebular::View
        expose :match_result do |match_result:|
          match_result
        end
      end
    end
  end
end
