# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Transaction", bullet: :skip do
  include_context "auth"

  explanation "Transactions"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) { JSON.parse(response_body, symbolize_names: true) }

  delete "api/finances/transactions/:id" do
    context "valid id" do
      let(:id) { transaction.id }
    end

    context "invalid id" do
      let(:id) { 474747 }

      example_request "Returns not found" do
        expect(response_status).to be(404)
      end
    end
  end
end
