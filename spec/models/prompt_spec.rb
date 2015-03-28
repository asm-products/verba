require 'rails_helper'

describe Prompt do
  let!(:prompt) { create(:prompt) }
  let!(:prompt2) { create(:prompt, content: "You should write more.") }

  it { should validate_presence_of(:content) }

  describe "#make_prompt_of_the_day" do
    before do
      prompt.make_prompt_of_the_day!
    end

    it "makes the prompt today's prompt" do
      expect(prompt.prompt_of_the_day).to eq(true)
    end

    it "there should only be one prompt of the day" do
      prompt2.make_prompt_of_the_day!
      expect(Prompt.find_by(prompt_of_the_day: true)).to eq(prompt2)
      expect(Prompt.find_by(prompt_of_the_day: true)).not_to eq(prompt)
    end

    it "prompt should be marked as used" do
      expect(prompt.used).to eq(true)
    end
  end
end
