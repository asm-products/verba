class PasswordReset < ActiveRecord::Base
  after_create :generate_token

  belongs_to :user

  delegate :email, to: :user

  def expired?
    if created_at < (Time.zone.now - 1.hour)
      true
    else
      false
    end
  end

  private

  def generate_token
    update(token: SecureRandom.base64(24))
  end
end
