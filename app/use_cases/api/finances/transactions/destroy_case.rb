# frozen_string_literal: true

class ::Api::Finances::Transactions::DestroyCase
  include ActiveModel::Model

  attr_accessor :transaction

  validates :transaction, presence: true

  def perform
    transaction.destroy! if valid?
  rescue StandardError => e
    errors.add(:base, e.message)
  end
end
