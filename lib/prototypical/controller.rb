module Prototypical
  module Controller
    def self.included(base)
      base.before_action :enable_prototyping if Prototypical.enable_on_include?
      base.helper_method :prototyping?
    end

    def enable_prototyping
      return unless Prototypical.enabled?

      inject_prototypical_template_path
      @prototyping = true
    end

    def prototyping?
      !!@prototyping
    end

  private
    def inject_prototypical_template_path
      prepend_view_path Rails.root.join(Prototypical.template_path)
    end
  end
end