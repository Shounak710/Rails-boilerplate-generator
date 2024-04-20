# frozen_string_literal: true

class Finances::PaymentMethods::DestroyCase
  include ActiveModel::Model

  attr_accessor :payment_method

  validates :payment_method, presence: true

  def perform
    payment_method.destroy! if valid?
  rescue StandardError => e
    errors.add(:base, e.message)
  end
end
