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

        @controller = StubController.new

        @expected_view_path = Rails.root.join('app/prototypes')
      end

      describe 'when Prototypical.enabled? is true' do
        setup { Prototypical.stubs(:enabled?).returns(true) }

        it 'should append the protypical view path' do
          @controller
            .expects(:prepend_view_path)
            .with(@expected_view_path)

          @controller.enable_prototyping
        end
      end

      describe 'when Prototypical.enabled? is false' do
        setup { Prototypical.stubs(:enabled?).returns(false) }

        it 'should do nothing' do
          @controller
            .expects(:prepend_view_path)
            .with(@expected_view_path)
            .never

          @controller.enable_prototyping
        end
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