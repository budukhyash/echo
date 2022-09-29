class Endpoint < ApplicationRecord

  before_save :code_exists?

  enum verb: [:GET, :POST, :PUT, :DELETE, :PATCH]
  validates_presence_of :category, :path, :verb, :response

  private

  def code_exists?
    raise 'Code missing in body' if response['code'].nil? 
  end

end
