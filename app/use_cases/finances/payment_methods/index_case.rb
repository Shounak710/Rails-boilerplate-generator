# frozen_string_literal: true

class Finances::PaymentMethods::IndexCase < IndexCase
  def initialize(attributes)
    @attributes = attributes
    super(page_parameters: attributes[:page_parameters], relation: filtered_payment_methods)
  end

  private

    def filtered_payment_methods
      filter_params = @attributes[:filter_parameters]

      payment_methods
    end

    def payment_methods
      @payment_methods ||= ::Finances::Payment_method.order(date: :desc)
    end
end
