require "rails_helper"

describe PasswordReset do
  let(:user) { create(:user) }
  let!(:password_reset) { create(:password_reset, user_id: user.id) }

  describe "#expired?" do
    it "should be valid within 1 hour of being created" do
      Timecop.freeze(Time.zone.now + 10.minutes) do
        expect(password_reset.expired?).to eq(false)
      end
    end

    it "should expire after 1 hour" do
      Timecop.freeze(Time.zone.now + 2.hours) do
        expect(password_reset.expired?).to eq(true)
      end
    end
  end
end
