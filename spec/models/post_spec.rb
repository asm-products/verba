require 'rails_helper'

describe Post do
  describe "creating a post" do
    context "after_save" do
      let(:post) { create(:post, content: "Hello world.") }

      it "should update word_count" do
        expect(post.word_count).to eq(2)
      end
    end
  end
end
