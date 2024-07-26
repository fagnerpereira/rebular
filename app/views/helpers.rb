# auto_register: false

require 'pry'
module Rebular
  module Views
    module Helpers
      include ViteHanami::TagHelpers

      def vite_client
        return unless src = vite_manifest.vite_client_src

        tag.script(src: src, type: 'module')
      end

      def vite_javascript(*names,
                          type: 'module',
                          asset_type: :javascript,
                          skip_preload_tags: false,
                          skip_style_tags: false,
                          crossorigin: 'anonymous',
                          **options)
        entries = vite_manifest.resolve_entries(*names, type: asset_type)
        tags = javascript_tag(*entries.fetch(:scripts), crossorigin:, type:, **options)
        puts "tags: #{tags}"
        tags << vite_modulepreload(*entries.fetch(:imports), crossorigin:) unless skip_preload_tags
        tags << stylesheet(*entries.fetch(:stylesheets)) unless skip_style_tags
        ::Hanami::Utils::Escape::SafeString.new(tags)
      end

      def vite_modulepreload(*sources, crossorigin:)
        puts "sources: #{sources}"
        _safe_tags(*sources) { |source|
          href = asset_path(source)
          _push_promise(href, as: :script)

          html.link(rel: 'modulepreload', href: href, as: :script, crossorigin: crossorigin)
        }
      end
    end
  end
end
