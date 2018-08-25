module Graph
  module Types
    class BaseType < GraphQL::Schema::Object
      def self.field(*args, **options, &block)
        super(*args, **options.reverse_merge(null: true), &block)
      end
    end
  end
end
