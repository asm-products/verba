require 'rails_helper'

describe Post do
  describe "#update_points" do
    let(:post) { create :post }

    context "with no words" do
      it "has 0 points" do
        post.content = ""
        post.save

        expect(post.points).to eq(0)
      end
    end

    context "with under 750 words" do
      it "has 1 point" do
        post.save

        expect(post.points).to eq(1)
      end
    end

    context "with over 750" do
      it "has 2 points" do
        additional_content = ("Lorem ") * 300
        post.content += additional_content
        post.save

        expect(post.points).to eq(2)
      end
    end
  end

  describe "public posts" do
    let(:published_post) { create :post, published: true }
    let(:post) { create :post }
    let(:published_posts) { Post.published }

    it "should only show public posts" do
      expect(published_posts).to include(published_post)
      expect(published_posts).not_to include(post)
    end

    describe "#publish" do
      it "should make the post public" do
        post.publish

        expect(published_posts).to include(post)
      end
    end

    describe "#unpublish" do
      it "should make the post private" do
        published_post.unpublish

        expect(published_posts).not_to include(published_post)
      end
    end
  end
end
