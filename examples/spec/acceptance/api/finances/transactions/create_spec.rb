# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Transaction" do
  include_context "auth"

  explanation "Transactions"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) { JSON.parse(response_body, symbolize_names: true) }

  post "api/finances/transactions" do
    with_options scope: :transaction, with_example: true do
      parameter :account_id, "", required: false
parameter :amount, "", required: false
parameter :id, "", required: false
parameter :memo, "", required: false
parameter :method_id, "", required: false
parameter :type, "", required: false

      # parameter :color, "Color for the reservation", required: false
    end

    let(:data) { result[:transaction] }

    context "" do
    end
  end
end
