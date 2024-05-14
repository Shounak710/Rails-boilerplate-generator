# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::Finances::Transactions::DestroyCase, type: :model do
  let(:instance) { described_class.new(data) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:transaction) }
  end

  describe "perform" do
    let(:subject) { instance.perform }

    let(:data) do
      {
        transaction: transaction
      }
    end

    context "invalid data" do
      let(:transaction) { nil }

      it { is_expected.to be_falsey }

      it "adds error to use case" do
        subject
        expect(instance.errors.details).to eq({ transaction: [{ error: :blank }] })
      end
    end

    context "valid data" do
      let(:transaction) { } # create(:karte_entry)

      it "destroys record" do
        subject
        expect(::Api::Finances::Transaction.find_by(id: transaction.id)).to be_falsey
      end
    end
  end
end
