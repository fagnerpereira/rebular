# frozen_string_literal: true

require "hanami"
require 'vite_ruby'

module Rebular
  class App < Hanami::App
    environment :development do
      config.middleware.use(ViteRuby::DevServerProxy, ssl_verify_none: true) if ViteRuby.run_proxy?
    end

    # config.actions.content_security_policy
    #     .sub('script-src', "script-src 'unsafe-eval' 'unsafe-inline'")
    #     .sub('connect-src', "connect-src ws://#{ ViteRuby.config.host_with_port }")
    #     .sub('style-src', "style-src 'unsafe-inline'")
    config.actions.content_security_policy[:script_src] = "script-src 'unsafe-eval' 'unsafe-inline'"
    config.actions.content_security_policy[:connect_src] = "connect-src ws://#{ ViteRuby.config.host_with_port }"
    config.actions.content_security_policy[:style_src] = "style-src 'unsafe-inline'"
    # puts config.actions.content_security_policy

    # security.content_security_policy(
    #   security.content_security_policy
    #     .sub('script-src', "script-src 'unsafe-eval' 'unsafe-inline'")
    #     .sub('connect-src', "connect-src ws://#{ ViteRuby.config.host_with_port }")
    #     .sub('style-src', "style-src 'unsafe-inline'")
    # )
  end
end
