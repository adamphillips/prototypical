require 'test_helper'

require 'prototypical/controller'

module Prototypical
  class ControllerTest < ActiveSupport::TestCase
    class StubController
      def self.before_action(action); end
    end

    describe '#enable_prototyping' do
      setup do
        StubController.send :include, Controller
      end

      it 'should append the protypical view path' do
        controller = StubController.new

        expected_view_path = Rails.root.join('app/prototypes')

        controller
          .expects(:prepend_view_path)
          .with(expected_view_path)

        controller.enable_prototyping
      end
    end

    describe 'including' do
      describe 'when Prototypical.enable_on_include is false' do
        setup { Prototypical.stubs(:enable_on_include?).returns(false) }

        it 'should not automatically enable prototyping' do
          StubController
            .expects(:before_action)
            .with(:enable_prototyping)
            .never

          StubController.send :include, Controller
        end
      end

      describe 'when Prototypical.enabled_on_include? is true' do
        setup { Prototypical.stubs(:enable_on_include?).returns(true) }

        it 'should automatically enable prototyping' do
          StubController
            .expects(:before_action)
            .with(:enable_prototyping)

          StubController.send :include, Controller
        end
      end
    end
  end
end