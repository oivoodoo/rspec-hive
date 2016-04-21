require_relative 'query_builder'

module RSpec
  module Hive
    module QueryBuilderHelper
      def into_hive(schema)
        hive_connection_guard!
        ::RSpec::Hive::QueryBuilder.new(schema, connection)
      end

      private

      def hive_connection_present?
        respond_to?(:connection) &&
          (connection.is_a?(RBHive::TCLIConnection) ||
            connection.is_a?(RSpec::Hive::ConnectionDelegator))
      end

      def hive_connection_guard!
        raise 'Include WithHiveConnection' unless hive_connection_present?
      end
    end
  end
end
