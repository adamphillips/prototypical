require 'test_helper'

class RootTest < ActionDispatch::IntegrationTest
  it 'should work' do
    get '/'
    assert_response :success
  end
end