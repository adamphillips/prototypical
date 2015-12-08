require 'test_helper'

class RootTest < ActionDispatch::IntegrationTest
  it 'should work' do
    get '/'
    assert_response :success
  end

  it 'should display a prototype if there is one and prototyping is enabled' do
    get '/enabled_prototype'
    assert_response :success
    assert_match /Prototype enabled/, response.body
  end

  it 'should not display a prototype if prototyping is disabled' do
    get '/disabled_prototype'
    assert_response :success
    assert_match /Prototype disabled/, response.body
  end
end