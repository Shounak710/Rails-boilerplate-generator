# frozen_string_literal: true

class ::Api::V1::Therapists::Branch::Reservations::IndexCase < IndexCase
  def initialize(attributes)
    @attributes = attributes
    super(page_parameters: attributes[:page_parameters], relation: filtered_reservations)
  end

  private

    def filtered_reservations
      filter_params = @attributes[:filter_parameters]

      reservations
    end

    def reservations
      @reservations ||= ::Api::V1::Therapists::Branch::Reservation.order(date: :desc)
    end
end
