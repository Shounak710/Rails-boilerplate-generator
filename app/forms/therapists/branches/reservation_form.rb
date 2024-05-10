# frozen_string_literal: true

class ::Therapists::Branches::ReservationForm
  include ActiveModel::Model

  attr_accessor :branch_id, :end_time, :id, :id, :id, :id, :start_time, :therapist_id

  validates :branch_id, :end_time, :id, :id, :id, :id, :start_time, :therapist_id, presence: true

  attr_reader :record

  def save
    @record = id ? ::Therapists::Branches::Reservation.find(id) : ::Therapists::Branches::Reservation.new

    if valid?
      @record.update!(attributes)
      true
    else
      false
    end
  rescue => e
    errors.add(:base, e.message)
    false
  end

  private

    def attributes
      { branch_id: branch_id, end_time: end_time, id: id, id: id, id: id, id: id, start_time: start_time, therapist_id: therapist_id }
    end
end
