# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::Finances::Transactions::IndexCase, type: :model do
  let(:instance) { described_class.new(data) }

  describe "perform" do
    let(:subject) { instance.perform }

    let!(:data) do
      {}
    end

    context "pagination" do
      it "contains pagination info" do
        expect(subject.pagination).not_to be_nil
      end
    end

    context "data" do
      it "contains expected items" do
        expect(subject.items).to eq([])
      end
    end
  end
end
