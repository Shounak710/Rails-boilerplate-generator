# frozen_string_literal: true

class {class_name}Serializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  type :{route_singular}

  attributes {object_param_items}
end
