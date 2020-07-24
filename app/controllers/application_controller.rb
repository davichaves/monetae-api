class ApplicationController < ActionController::API
  before_action :check_api_key

  def not_found
    render json: { error: 'not_found' }
  end

  def check_api_key
    header = request.headers['api-key']
    header = header.split(' ').last if header
    if header != ENV['API_KEY']
      render json: { error: "incorrect api key" }, status: :unauthorized
    end
  end
end
