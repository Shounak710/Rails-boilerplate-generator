# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "{route_singular_capitalized}" do
  include_context "auth"

  explanation "{route_capitalized}"

  header "Accept", "application/json"
  header "content-type", "application/json; charset=utf-8"

  let(:result) {{ JSON.parse(response_body, symbolize_names: true) }}

  post "{api_url}" do
    with_options scope: :{route_singular}, with_example: true do
      {parameter_explanations}
      # parameter :color, "Color for the reservation", required: false
    end

    let(:data) {{ result[:{route_singular}] }}

    context "" do
    end
  end
end
