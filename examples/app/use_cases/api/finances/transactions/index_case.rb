# frozen_string_literal: true

class ::Api::Finances::Transactions::IndexCase < IndexCase
  def initialize(attributes)
    @attributes = attributes
    super(page_parameters: attributes[:page_parameters], relation: filtered_transactions)
  end

  private

    def filtered_transactions
      filter_params = @attributes[:filter_parameters]

      transactions
    end

    def transactions
      @transactions ||= ::Api::Finances::Transaction.order(date: :desc)
    end
end
