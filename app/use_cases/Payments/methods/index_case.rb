# frozen_string_literal: true

class Payments::Methods::IndexCase < IndexCase
  def initialize(attributes)
    @attributes = attributes
    super(page_parameters: attributes[:page_parameters], relation: filtered_methods)
  end

  private

    def filtered_methods
      filter_params = @attributes[:filter_parameters]

      methods
    end

    def methods
      @methods ||= ::Payments::Method.order(date: :desc)
    end
end
