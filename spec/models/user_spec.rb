
require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:username)}
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to allow_value('email@gmail.com').for(:email) }
  it { is_expected.not_to allow_value('email_unvalid').for(:email) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }

  it { should have_many(:refunds) }

  describe "#subscribers" do
    let(:subscribed_user) { create(:user) }
    let(:unsubscribed_user) { create(:user, unsubscribe: true) }

    it "should only return subscribed_users" do
      subscribed_users = User.subscribers

      expect(subscribed_users).to include(subscribed_user)
      expect(subscribed_users).not_to include(unsubscribed_user)
    end
  end

  describe "#days_since_registration" do
    it "returns 0 in first day" do
      user = create(:user)
      expect(user.days_since_registration).to be_zero
    end

    it "returns the number of days since registration" do
      user = create(:user)
      user.created_at = 3.days.ago

      expect(user.days_since_registration).to eq(3)
    end
  end

  describe "#weeks_since_registration" do
    it "returns 0 in first week" do
      user = create(:user)
      expect(user.weeks_since_registration).to be_zero
    end

    it "returns the number of weeks since registration" do
      user = create(:user)
      user.created_at = 30.days.ago

      expect(user.weeks_since_registration).to eq(4)
    end
  end

  describe "#week_days_since_registration" do
    it "returns the day number in the week since registartion" do
      user = create(:user)
      user.created_at = 8.days.ago

      expect(user.week_day_since_registration).to eq(1)
    end
  end

  describe "#is_public_profile?" do
    context "when the user has at least one published post" do
      it "should return true" do
        user = create(:user)
        post = create(:post, user_id: user.id, published: true)

        expect(user.is_public_profile?).to eq(true)
      end
    end

    context "when the user has posts, but none are published" do
      it "should return false" do
        user = create(:user)
        post = create(:post, user_id: user.id)
        post = create(:post, user_id: user.id)

        expect(user.is_public_profile?).to eq(false)
      end
    end
  end

  describe "#days_left_in_trial" do
    context "user signed up 1 day ago" do
      it "should have 6 days left in trial" do
        user = create(:user, created_at: 1.day.ago)

        expect(user.days_left_in_trial).to eq(6)
      end
    end

    context "user signed up 8 days ago" do
      it "should have 0 days left in trial" do
        user = create(:user, created_at: 8.days.ago)

        expect(user.days_left_in_trial).to eq(0)
      end
    end
  end

  describe "#eligible_for_refund?" do
    let(:user) { create(:user) }

    context "eligible" do
      it "should return true" do
        (30.days.ago.to_date..DateTime.now).each do |date|
          post = create(:post, user: user)
          post.update_attribute(:created_at, date)
        end

        expect(user.eligible_for_refund?).to eq(true)
      end
    end

    context "not eligible" do
      context "refund already created in the last 30 days" do
        it "should return false" do
          (30.days.ago.to_date..DateTime.now).each do |date|
            post = create(:post, user: user)
            post.update_attribute(:created_at, date)
          end

          refund = create(:refund, user: user)

          expect(user.eligible_for_refund?).to eq(false)
        end
      end

      context "not long enough of a streak" do
        it "should return false" do
          create(:post, user: user)

          expect(user.eligible_for_refund?).to eq(false)
        end
      end
    end
  end
end
