# frozen_string_literal: true

require "rails_helper"

RSpec.describe {class_name}::ShowCase, type: :model do
  let(:instance) {{ described_class.new(data) }}

  describe "#perform" do
    let(:data) do
      {{}}
    end

    let(:subject) {{ instance.perform }}

    it "returns the data" do
      expect(subject).to eq()
    end
  end
end
