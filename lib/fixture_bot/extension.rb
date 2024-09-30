# frozen_string_literal: true

module FactoryBot
  module Syntax
    module Default
      class DSL
        def preload(table, &block)
          ::FixtureBot::FixtureCreator.tables[table] ||= []
          ::FixtureBot::FixtureCreator.tables[table] << block
        end
      end
    end
  end
end
