require "rails_helper"

describe Comment do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { create(:comment, post: post, user: user) }

  it { should belong_to(:user) }
  it { should belong_to(:post) }

  describe "#username" do
    it "should return the user's username" do
      expect(comment.username).to eq(user.username)
    end
  end
end
