# frozen_string_literal: true

class Finances::PaymentMethods::UpdateCase
  def initialize(attributes)
    @form = ::Finances::PaymentMethodForm.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end