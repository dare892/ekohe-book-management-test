class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: {error: 'requested records not found.'}, status: :unprocessable_entity
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
