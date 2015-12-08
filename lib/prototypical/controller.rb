module Prototypical
  module Controller
    def self.included(base)
      base.before_action :enable_prototyping if Prototypical.enable_on_include?
    end

    def enable_prototyping
      return unless Prototypical.enabled?

      append_prototypical_view_path
    end

  private
    def append_prototypical_view_path
      prepend_view_path Rails.root.join(Prototypical.view_path)
    end
  end
end