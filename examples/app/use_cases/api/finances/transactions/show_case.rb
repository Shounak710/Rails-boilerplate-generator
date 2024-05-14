# frozen_string_literal: true

class ::Api::Finances::Transactions::ShowCase
  include ActiveModel::Model

  attr_accessor :transaction

  def perform
    transaction
  end
end