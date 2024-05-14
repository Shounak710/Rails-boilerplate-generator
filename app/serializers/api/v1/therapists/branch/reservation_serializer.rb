# frozen_string_literal: true

class ::Api::V1::Therapists::Branch::ReservationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  type :reservation

  attributes :branch_id, :end_time, :id, :item_ids, :product_ids, :start_time, :therapist_id
end
