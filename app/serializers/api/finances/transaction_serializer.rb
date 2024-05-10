# frozen_string_literal: true

class ::Api::Finances::TransactionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  type :transaction

  attributes :account_id, :amount, :id, :memo, :method_id, :type
end
