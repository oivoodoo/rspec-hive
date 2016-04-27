require_relative 'type_faker'

module RSpec
  module Hive
    class QueryBuilder
      class ValueByTypeStrategy
        def missing(column)
          RSpec::Hive::QueryBuilder::TypeFaker.mock(column.type)
        end
      end
    end
  end
end
