# frozen_string_literal: true

class Finances::Transactions::IndexCase < IndexCase
  def initialize(attributes)
    @attributes = attributes
    super(page_parameters: attributes[:page_parameters], relation: filtered_transactions_new)
  end

  private

    def filtered_transactions_new
      filter_params = @attributes[:filter_parameters]

      transactions_new
    end

    def transactions_new
      @transactions_new ||= ::Finances::TransactionNew.order(date: :desc)
    end
end
