module InventoryManager
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found(exception)
      render json: { error: "Record not found", message: exception.message }, status: :not_found
    end
  end
end
