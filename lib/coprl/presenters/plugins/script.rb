require_relative 'script/component'

module Coprl
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
          def view_dir_script(pom)
            File.join(__dir__, '../../../..', 'views', 'components')
          end


          def render_script(comp, render:, components:, index:)
            render.call(:erb, :script,
                        views: view_dir_script(comp),
                        locals: { comp: comp, components: components, index: index })
          end
        end

      end
    end
  end
end
