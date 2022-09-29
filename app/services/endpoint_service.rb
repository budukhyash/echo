class EndpointService
  def initialize
    @name = 'EndpointService'
  end

  def all_endpoints
    Endpoint.all.map { |ep| present(ep) }
  end

  def create_endpoint(body)
    data = endpoint_data(body)
    record = Endpoint.create(data)
    present(record)
  end

  def delete_endpoint(id)
    record = Endpoint.find(id)
    record.destroy
  end

  def show_endpoint(id)
    record = Endpoint.find(id)
    present(record)
  end

  def update_endpoint(id, body)
    data = endpoint_data(body)
    record = Endpoint.update(id, data)
    present(record)
  end

  private

  def endpoint_data(body)
    type = body['data']['type']
    verb = body['data']['attributes']['verb']
    path = body['data']['attributes']['path']
    response = body['data']['attributes']['response']
    {
      verb: verb,
      path: path,
      category: type,
      response: response
    }
  end

  def present(endpoint)
    {
      id: endpoint.id,
      type: endpoint.category,
      verb: endpoint.verb,
      path: endpoint.path,
      response: endpoint.response
    }
  end
end