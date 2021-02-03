class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def create
  end
end
