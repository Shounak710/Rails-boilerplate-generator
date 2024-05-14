# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "{route_singular_capitalized}", bullet: :skip do
  include_context "auth"

  explanation "{route_capitalized}"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) {{ JSON.parse(response_body, symbolize_names: true) }}

  delete "{api_url}/:id" do
    context "valid id" do
      let(:id) {{ {route_singular}.id }}
    end

    context "invalid id" do
      let(:id) {{ 474747 }}

      example_request "Returns not found" do
        expect(response_status).to be(404)
      end
    end
  end
end
