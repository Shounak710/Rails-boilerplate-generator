# frozen_string_literal: true

class {module_name}::IndexCase < IndexCase
  def initialize(attributes)
    @attributes = attributes
    super(page_parameters: attributes[:page_parameters], relation: filtered_{route})
  end

  private

    def filtered_{route}
      filter_params = @attributes[:filter_parameters]

      {route}
    end

    def {route}
      @{route} ||= ::{class_namespace}::{pascalcase_route_singular}.order(date: :desc)
    end
end
