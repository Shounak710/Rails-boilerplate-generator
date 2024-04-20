
class Finances::PaymentMethods::CreateCase
  def initialize(attributes)
    @form = ::Finances::PaymentMethodForm.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end