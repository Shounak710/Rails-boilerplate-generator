# frozen_string_literal: true

class ::Api::Finances::TransactionForm
  include ActiveModel::Model

  attr_accessor :account_id, :amount, :id, :memo, :method_id

  validates :account_id, :amount, :id, :memo, :method_id, presence: true

  attr_reader :record

  def save
    @record = id ? ::Api::Finances::Transaction.find(id) : ::Api::Finances::Transaction.new

    if valid?
      @record.update!(attributes)
      true
    else
      false
    end
  rescue => e
    errors.add(:base, e.message)
    false
  end

  private

    def attributes
      { account_id: account_id, amount: amount, id: id, memo: memo, method_id: method_id }
    end
end
