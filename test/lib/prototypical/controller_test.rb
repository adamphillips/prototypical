require 'test_helper'

require 'prototypical/controller'

module Prototypical
  class ControllerTest < ActiveSupport::TestCase
    def self.before_action(action); end

    include Controller

    describe '#append_prototypical_view_path' do
      setup do
        stubs(:before_action)
      end

      it 'should append the protypical view path' do
        expected_view_path = Rails.root.join('app/prototypes')

        expects(:append_view_path)
          .with(expected_view_path)

        append_prototypical_view_path
      end
    end
  end
end