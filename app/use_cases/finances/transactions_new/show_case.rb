# frozen_string_literal: true

class Finances::Transactions::ShowCase
  include ActiveModel::Model

  attr_accessor :transaction_new

  def perform
    transaction_new
  end
end