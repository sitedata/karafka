# frozen_string_literal: true

module Karafka
  module Contracts
    # Consumer group topic validation rules
    class ConsumerGroupTopic < Dry::Validation::Contract
      params do
        required(:id).filled(:str?, format?: Karafka::Contracts::TOPIC_REGEXP)
        required(:name).filled(:str?, format?: Karafka::Contracts::TOPIC_REGEXP)
        required(:backend).filled(included_in?: %i[inline sidekiq])
        required(:consumer).filled
        required(:deserializer).filled
        required(:max_bytes_per_partition).filled(:int?, gteq?: 0)
        required(:start_from_beginning).filled(:bool?)
        required(:batch_consuming).filled(:bool?)
      end
    end
  end
end
