# frozen_string_literal: true

class ::Therapists::Branches::Reservations::CreateCase
  def initialize(attributes)
    @form = ::Therapists::Branches::ReservationForm.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end