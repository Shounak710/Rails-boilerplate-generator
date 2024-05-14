# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Transaction", bullet: :skip do
  include_context "auth"

  explanation "Transactions"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) { JSON.parse(response_body, symbolize_names: true) }

  put "api/finances/transactions/:id" do
    with_options scope: :transaction, with_example: true do
      parameter :account_id, "", required: false
parameter :amount, "", required: false
parameter :id, "", required: false
parameter :memo, "", required: false
parameter :method_id, "", required: false
parameter :type, "", required: false

      # parameter :unit_id, "Unit id for the reservation", required: false
    end

    let(:raw_post) { params.to_json }

    let(:data) { result[:transaction] }

    before do
      # create object with id
    end

    context "valid id" do
      let(:id) { transaction.id }

      it_behaves_like "authenticable_route", status: 200

      context "sufficient data present" do
        example_request "Updates data" do
          
        end
      end

      context "insufficient data present" do
        let(:expected_response) do
          
        end

        example_request "Return unprocessable entity" do
          expect(response_status).to eq(422)
        end

        example_request "Returns expected error message" do
          expect(result).to eq(expected_response)
        end
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
