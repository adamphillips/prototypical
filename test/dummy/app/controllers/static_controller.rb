require 'prototypical/controller'

class StaticController < ApplicationController
  include Prototypical::Controller

  before_action :enable_prototyping, only: [:enabled_prototype]

  def home
  end

  def enabled_prototype
  end

  def disabled_prototype
  end
end