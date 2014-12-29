require 'rails_helper'

describe PostSearch do
  let (:user) { create :user }
  let (:post1) { create :post, user: user }
  let (:post2) { create :post, user: user }
  let (:post3) { create :post, user: user, content: "Hockey" }

  describe ".search" do
    context "given a search term hockey" do
      let(:search) { PostSearch.search("hockey", user) }

      it "should find the record with content of hockey" do
        expect(search).to include(post3)
      end

      it "should not find the records that don't contain hockey" do
        expect(search).not_to include(post1, post2)
      end
    end
  end
end
