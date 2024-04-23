# frozen_string_literal: true

class Finances::Transactions::UpdateCase
  def initialize(attributes)
    @form = ::Finances::TransactionNewForm.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end