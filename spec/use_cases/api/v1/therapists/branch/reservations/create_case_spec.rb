# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::V1::Therapists::Branch::Reservations::CreateCase, type: :model do
  let(:instance) { described_class.new(data) }

  let(:reservation_form) { instance_double(::Api::V1::Therapists::Branch::ReservationForm) }

  describe "perform" do
    let(:subject) { instance.perform }

    before do
      allow(::Api::V1::Therapists::Branch::ReservationForm).to receive(:new).and_return(reservation_form)
      allow(reservation_form).to receive(:save).and_return(true)
    end

    let!(:data) do
      {}
    end

    it "passes correct attributes to form" do
      expect(::Api::V1::Therapists::Branch::ReservationForm).to receive(:new).with(data)
      subject
    end

    it "calls save on form" do
      expect(reservation_form).to receive(:save)
      subject
    end

    it { is_expected.to eq(reservation_form) }
  end
end
