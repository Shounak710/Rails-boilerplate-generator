# frozen_string_literal: true

class ::Api::Finances::Transactions::CreateCase
  def initialize(attributes)
    @form = ::Api::Finances::TransactionForm.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end