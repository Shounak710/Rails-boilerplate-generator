# frozen_string_literal: true

class ::Api::V1::Therapists::Branch::Reservations::CreateCase
  def initialize(attributes)
    @form = ::Api::V1::Therapists::Branch::ReservationForm.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end