class AuthenticatedController < ApplicationController
  before_action :require_user
  before_action :require_subscriber, if: Proc.new { feature_active?(:payments) }
end
