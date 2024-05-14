# frozen_string_literal: true

require "rails_helper"

RSpec.describe {class_name}::DestroyCase, type: :model do
  let(:instance) {{ described_class.new(data) }}

  describe "validations" do
    it {{ is_expected.to validate_presence_of(:{route_singular}) }}
  end

  describe "perform" do
    let(:subject) {{ instance.perform }}

    let(:data) do
      {{
        {route_singular}: {route_singular}
      }}
    end

    context "invalid data" do
      let(:{route_singular}) {{ nil }}

      it {{ is_expected.to be_falsey }}

      it "adds error to use case" do
        subject
        expect(instance.errors.details).to eq({{ {route_singular}: [{{ error: :blank }}] }})
      end
    end

    context "valid data" do
      let(:{route_singular}) {{ }} # create(:karte_entry)

      it "destroys record" do
        subject
        expect({form_name}.find_by(id: {route_singular}.id)).to be_falsey
      end
    end
  end
end
