require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    helper_method :list_fields, :form_fields

    include DefaultActions
    include Pagination

    private

    def list_fields
      form_fields
    end

    def form_fields
      default_fields
    end

    def default_fields
      resource_class.column_names - %w{id created_at updated_at password_digest}
    end

  end
end