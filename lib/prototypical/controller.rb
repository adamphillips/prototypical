module Prototypical
  module Controller
    def self.included(base)
      base.before_action :append_prototypical_view_path
    end

    def append_prototypical_view_path
      append_view_path Rails.root.join(Prototypical.view_path)
    end
  end
end