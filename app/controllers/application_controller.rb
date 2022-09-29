class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |e|
    render_error("#{e}", 400)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error('Record not found', 404)
  end

  def heart_beat
    render json: { message: 'Roger.. A-OK!' }
  end

  def render_error(message, code)
    render json: { status: :error, error: { message: message, code: code } }, status: code
  end

  def render_success(data = nil, code = 200)
    render json: { data: data, error: nil, status: :ok }, status: code
  end
end
