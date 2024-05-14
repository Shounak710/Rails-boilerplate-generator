# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Reservation" do
  include_context "auth"

  explanation "Reservations"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) { JSON.parse(response_body, symbolize_names: true) }

  get "api/v1/therapists/branch/reservations" do
    parameter :branch_id, "", required: false
parameter :end_time, "", required: false
parameter :id, "", required: false
parameter :item_ids, "", required: false
parameter :product_ids, "", required: false
parameter :start_time, "", required: false
parameter :therapist_id, "", required: false

    # parameter :type, "Specify the type of reservations to be included. Accepts 'analytical' for now", required: false
    parameter :page, "No", required: false
    parameter :per, "No", required: false

    context "pagination" do
      before do
        (1..25).each do

        end
      end

      it_behaves_like "paginate_resource"
    end

    context "response" do
      it_behaves_like "authenticable_route", status: 200

      context "no query parameter set" do
        let(:expected_response) {}

        example_request "Returns reservations" do
          expect(result[:reservations]).to eq(expected_response)
        end
      end

      context "sort order set" do
      end
    end
  end
end
