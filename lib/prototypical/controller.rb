module Prototypical
  module Controller
    def self.included(base)
      base.append_view_path Rails.root.join('app/prototypes')
    end
  end
end