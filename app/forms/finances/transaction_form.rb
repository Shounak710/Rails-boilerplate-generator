# frozen_string_literal: true

class Finances::TransactionForm
  include ActiveModel::Model

  attr_accessor :method_id, :category_id, :type, :memo, :amount

  validates :method_id, :category_id, :type, :memo, :amount, presence: true

  attr_reader :record

  def save
    @record = id ? ::Finances::Transaction.find(id) : ::Finances::Transaction.new

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
      { method_id: method_id, category_id: category_id, type: type, memo: memo, amount: amount }
    end
end
