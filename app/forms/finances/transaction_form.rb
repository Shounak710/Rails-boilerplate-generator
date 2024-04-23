# frozen_string_literal: true

class Finances::TransactionForm
  include ActiveModel::Model

  attr_accessor :amount, :category_id, :id, :memo, :method_id, :type

  validates :amount, :category_id, :id, :memo, :method_id, :type, presence: true

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
      { amount: amount, category_id: category_id, id: id, memo: memo, method_id: method_id, type: type }
    end
end
