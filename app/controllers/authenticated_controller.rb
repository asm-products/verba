class AuthenticatedController < ApplicationController
  before_action :require_user
  before_action :require_subscriber
end
