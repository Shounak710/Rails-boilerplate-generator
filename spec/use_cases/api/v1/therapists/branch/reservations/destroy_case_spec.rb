# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::V1::Therapists::Branch::Reservations::DestroyCase, type: :model do
  let(:instance) { described_class.new(data) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:reservation) }
  end

  describe "perform" do
    let(:subject) { instance.perform }

    let(:data) do
      {
        reservation: reservation
      }
    end

    context "invalid data" do
      let(:reservation) { nil }

      it { is_expected.to be_falsey }

      it "adds error to use case" do
        subject
        expect(instance.errors.details).to eq({ reservation: [{ error: :blank }] })
      end
    end

    context "valid data" do
      let(:reservation) { } # create(:karte_entry)

      it "destroys record" do
        subject
        expect(::Api::V1::Therapists::Branch::Reservation.find_by(id: reservation.id)).to be_falsey
      end
    end
  end
end
