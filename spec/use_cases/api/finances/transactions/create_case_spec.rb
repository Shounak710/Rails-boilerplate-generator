# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::Finances::Transactions::CreateCase, type: :model do
  let(:instance) { described_class.new(data) }

  let(:transaction_form) { instance_double(::Api::Finances::TransactionForm) }

  describe "perform" do
    let(:subject) { instance.perform }

    before do
      allow(::Api::Finances::TransactionForm).to receive(:new).and_return(transaction_form)
      allow(transaction_form).to receive(:save).and_return(true)
    end

    let!(:data) do
      {}
    end

    it "passes correct attributes to form" do
      expect(::Api::Finances::TransactionForm).to receive(:new).with(data)
      subject
    end

    it "calls save on form" do
      expect(transaction_form).to receive(:save)
      subject
    end

    it { is_expected.to eq(transaction_form) }
  end
end
