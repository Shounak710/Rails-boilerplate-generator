# frozen_string_literal: true

require "rails_helper"

RSpec.describe {class_name}::CreateCase, type: :model do
  let(:instance) {{ described_class.new(data) }}

  let(:{route_singular}_form) {{ instance_double({form_name}Form) }}

  describe "perform" do
    let(:subject) {{ instance.perform }}

    before do
      allow({form_name}Form).to receive(:new).and_return({route_singular}_form)
      allow({route_singular}_form).to receive(:save).and_return(true)
    end

    let!(:data) do
      {{}}
    end

    it "passes correct attributes to form" do
      expect({form_name}Form).to receive(:new).with(data)
      subject
    end

    it "calls save on form" do
      expect({route_singular}_form).to receive(:save)
      subject
    end

    it {{ is_expected.to eq({route_singular}_form) }}
  end
end
