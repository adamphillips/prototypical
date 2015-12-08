require 'test_helper'

require 'prototypical/controller'

module Prototypical
  class ControllerTest < ActiveSupport::TestCase
    class StubController; end

    it 'should append the protypical view path' do
      expected_view_path = Rails.root.join('app/prototypes')

      StubController
        .expects(:append_view_path)
        .with(expected_view_path)

      StubController.send :include, Controller
    end
  end
end