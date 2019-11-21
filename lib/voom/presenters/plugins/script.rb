require_relative 'script/component'

module Voom
  module Presenters
    module Plugins
      module Script

        module DSLComponents
          def script(src: nil, inline: nil, **attrs, &block)
            raise 'Must provide one of `src` or `inline`.' if (src.nil? && inline.nil?) || (src && inline)
            self << Script::Component.new(src: src, inline: inline, parent: self, **attrs, &block)
          end
        end

        module WebClientComponents
          def render_script(comp, render:, components:, index:)
            view_dir = File.join(__dir__, 'script')

            render.call(:erb, :script,
                        views: view_dir,
                        locals: { comp: comp, components: components, index: index })
          end
        end

      end
    end
  end
end
