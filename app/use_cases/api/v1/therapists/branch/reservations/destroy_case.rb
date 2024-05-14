# frozen_string_literal: true

class ::Api::V1::Therapists::Branch::Reservations::DestroyCase
  include ActiveModel::Model

  attr_accessor :reservation

  validates :reservation, presence: true

  def perform
    reservation.destroy! if valid?
  rescue StandardError => e
    errors.add(:base, e.message)
  end
end
