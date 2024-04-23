# frozen_string_literal: true

class {class_name}Form
  include ActiveModel::Model

  attr_accessor {object_attributes}

  validates {object_attributes}, presence: true

  attr_reader :record

  def save
    @record = id ? ::{class_name}.find(id) : ::{class_name}.new

    if valid?
      @record.update!(attributes)
      true
    else
      false
    end
  rescue => e
    errors.add(:base, e.message)
    false
  end

  private

    def attributes
      {attribute_dict}
    end
end
