require 'coprl/presenters/dsl/components/base'

module Coprl
  module Presenters
    module Plugins
      module Script

        class Component < DSL::Components::Base
          attr_reader :src, :inline, :id

          def initialize(src:, inline:, **attrs, &block)
            super(type: :script, **attrs, &block)

            @src = src
            @inline = html_safe(inline)
            @id = attrs[:id]
          end

          private

          def html_safe(string)
            string.respond_to?(:html_safe) ? string.html_safe : string
          end
        end

      end
    end
  end
end
