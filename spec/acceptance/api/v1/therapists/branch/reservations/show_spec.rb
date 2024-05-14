# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Reservation" do
  include_context "auth"

  explanation "Reservations"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) { JSON.parse(response_body, symbolize_names: true) }

  get "api/v1/therapists/branch/reservations/:id" do
    before do
      # create object
    end

    context "valid id" do
      it_behaves_like "authenticable_route", status: 200

      let(:expected_response) do
        {}
      end

      example_request "Returns single record" do
        expect(result[:reservation]).to eq(expected_response)
      end
    end

    context "invalid id" do
      let(:id) { 474747 }

      example_request "Returns not found" do
        expect(response_status).to be(404)
      end
    end
  end
end
