require 'voom/presenters/dsl/components/base'

module Voom
  module Presenters
    module Plugins
      module Script

        class Component < DSL::Components::Base
          attr_reader :src, :inline, :id

          def initialize(src:, inline:, **attrs, &block)
            super(type: :script, **attrs, &block)

            @src = src
            @inline = inline
            @id = attrs[:id]
          end
        end

      end
    end
  end
end
