# frozen_string_literal: true

class Finances::PaymentMethods::ShowCase
  include ActiveModel::Model

  attr_accessor :payment_method

  def perform
    payment_method
  end
end