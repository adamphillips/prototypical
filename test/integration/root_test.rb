require 'test_helper'

class RootTest < ActionDispatch::IntegrationTest
  it 'should work' do
    get '/'
    assert_response :success
  end

  it 'should display a prototype if there is one' do
    get '/has_prototype'
    assert_response :success
  end
end