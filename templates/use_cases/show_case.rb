# frozen_string_literal: true

class {class_name}::ShowCase
  include ActiveModel::Model

  attr_accessor :{route_singular}

  def perform
    {route_singular}
  end
end