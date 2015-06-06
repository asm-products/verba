require "rails_helper"

describe Comment do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { create(:comment, post: post, user: user) }

  it { should belong_to(:user) }
  it { should belong_to(:post) }

  describe "#serializable_hash" do
    it "should include the user's username" do
      expect(comment.serializable_hash).to include({username: user.username})
    end

    it "should include the content" do
      expect(comment.serializable_hash).to include({content: comment.content})
    end

    it "should include the date" do
      expect(comment.serializable_hash).to include({date: comment.date})
    end
  end
end
