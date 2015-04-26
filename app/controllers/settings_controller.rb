class SettingsController < ApplicationController
  def show
    @profile = Profile.new(current_user, view_context)
  end
end
