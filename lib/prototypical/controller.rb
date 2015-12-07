module Prototypical
  module Controller
    def self.included(base)
      base.append_view_path Rails.root.join(Prototypical.view_path)
    end
  end
end