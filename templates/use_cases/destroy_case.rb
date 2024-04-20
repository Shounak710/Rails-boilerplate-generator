# frozen_string_literal: true

class {module_name}::DestroyCase
  include ActiveModel::Model

  attr_accessor :{route_singular}

  validates :{route_singular}, presence: true

  def perform
    {route_singular}.destroy! if valid?
  rescue StandardError => e
    errors.add(:base, e.message)
  end
end
