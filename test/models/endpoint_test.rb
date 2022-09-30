require "test_helper"

class EndpointTest < ActiveSupport::TestCase


  test 'should not save endpoint without response' do
    e = Endpoint.new(path: '/yash', verb: 'GET', category: 'yash')
    assert_not e.save, 'Saved the endpoint without a response'
  end

  test 'should not save endpoint without code' do
    e = Endpoint.new(path: '/yash', verb: 'GET', category: 'yash', response: { body: 'yash' })
    assert_not e.save, 'Saved the endpoint without a status code'
  end

  test 'verb should be one of these [:GET, :POST, :PUT, :DELETE, :PATCH]' do
    e = Endpoint.new(path: '/yash', verb: 'ok', category: 'yash', response: { body: 'yash' , "code": '200'})
    assert_not e.save, 'Saved the endpoint without verb as ok'
  end

  test 'Should save a valid endpoint' do
    e = Endpoint.new(path: '/yash', verb: 'GET', category: 'yash', response: { body: 'yash' , "code": '200'})
    assert_not e.save, 'Saved the endpoint'
  end

end
