require 'rails_helper'

describe Achievement do
  let (:user) { create(:user) }

  context "self.earned_by?" do
    it "should raise an error" do
      expect( -> { Achievement.earned_by?(user) }).to raise_error(RuntimeError, 'Override this in a child class.')
    end
  end
end
