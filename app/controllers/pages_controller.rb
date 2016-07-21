class PagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard;end

  def setting_of_twitter;end
end
