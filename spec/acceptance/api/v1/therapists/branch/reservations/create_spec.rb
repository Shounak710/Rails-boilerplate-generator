# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Reservation" do
  include_context "auth"

  explanation "Reservations"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) { JSON.parse(response_body, symbolize_names: true) }

  post "api/v1/therapists/branch/reservations" do
    with_options scope: :reservation, with_example: true do
      parameter :branch_id, "", required: false
parameter :end_time, "", required: false
parameter :id, "", required: false
parameter :item_ids, "", required: false
parameter :product_ids, "", required: false
parameter :start_time, "", required: false
parameter :therapist_id, "", required: false

      # parameter :color, "Color for the reservation", required: false
    end

    let(:data) { result[:reservation] }

    context "" do
    end
  end
end
