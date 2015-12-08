module Prototypical
  module Controller
    def enable_prototyping
      append_prototypical_view_path
    end

  private
    def append_prototypical_view_path
      prepend_view_path Rails.root.join(Prototypical.view_path)
    end
  end
end