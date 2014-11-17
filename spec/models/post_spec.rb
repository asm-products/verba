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
end
