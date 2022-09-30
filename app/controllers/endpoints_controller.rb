class EndpointsController < ApplicationController
  def index
    res = EndpointService.new.all_endpoints
    render_success res
  end

  def create
    body = JSON.parse(request.body.read)
    validate body
    response = EndpointService.new.create_endpoint(body)
    render_success(response, 201)
  end

  def show
    response = EndpointService.new.show_endpoint(params[:id])
    render_success response
  end

  def update
    body = JSON.parse(request.body.read)
    validate(body)
    response = EndpointService.new.update_endpoint(params[:id], body)
    render_success response
  end

  def destroy
    EndpointService.new.delete_endpoint(params[:id])
  end

  def all
    path = '/' + params[:path]
    verb = request.request_method
    puts path, verb
    record = Endpoint.where(verb: verb, path: path).first
    if record.nil?
      render_error("Requested page #{verb} #{path} does not exist", 404)
      return
    end
    render json: record.response['body'], status: record.response['code']
  end

  private

  def validate(body)
    type = body['data']['type']
    verb = body['data']['attributes']['verb']
    path = body['data']['attributes']['path']

    raise ActionController::ParameterMissing, 'type' unless type.present?
    raise ActionController::ParameterMissing, 'path' unless path.present?
    raise ActionController::ParameterMissing, 'verb' unless verb.present?
    return if Endpoint.verbs.keys.include?(verb)

    raise ActionController::ParameterMissing, "verb should be one of #{Endpoint.verbs.keys.to_s}"
  end

end
