module RSpec
  module Hive
    module WithHiveConnection
      def self.included(mod)
        mod.before(:all) do
          connection
        end

        mod.before(:each) do
          connection.switch_database(DbName.random_name)
        end

        mod.after(:all) do
          hive_connector.stop_connection(connection) unless hive && connection
        end
      end

      def connection
        @connection ||= hive_connector.start_connection
      end

      private

      def hive_connector
        ::RSpec::Hive.connector
      end
    end
  end
end
