module RSpec
  module Hive
    class QueryBuilder
      class NullStrategy
        def missing(_column)
          '\N'
        end
      end
    end
  end
end
