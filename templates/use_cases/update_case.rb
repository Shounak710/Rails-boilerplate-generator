# frozen_string_literal: true

class {class_name}::UpdateCase
  def initialize(attributes)
    @form = {form_name}Form.new(attributes)
  end

  def perform
    @form.save
    @form
  end
end