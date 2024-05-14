# frozen_string_literal: true

class ::Api::V1::Therapists::Branch::Reservations::ShowCase
  include ActiveModel::Model

  attr_accessor :reservation

  def perform
    reservation
  end
end