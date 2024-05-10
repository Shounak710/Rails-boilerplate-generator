# frozen_string_literal: true

class ::Therapists::Branches::Reservations::ShowCase
  include ActiveModel::Model

  attr_accessor :reservation

  def perform
    reservation
  end
end