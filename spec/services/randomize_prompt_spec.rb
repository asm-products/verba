require "rails_helper"

describe RandomizePrompt do
  let(:service) { RandomizePrompt.new }
  let!(:random_prompt)  { create(:prompt) }
  let!(:on_deck_prompt) { create(:prompt, on_deck: true) }
  let!(:current_prompt) { create(:prompt, prompt_of_the_day: true) }


  describe "#call" do
    context "success" do
      it "should return true" do
        expect(service.call).to eq(true)
      end

      it "should have changed the on deck prompt to the prompt of the day" do
        allow(Prompt).to receive(:random).and_return(random_prompt)

        service.call

        prompt_of_the_day = Prompt.today
        expect(prompt_of_the_day).to eq(on_deck_prompt)
        expect(prompt_of_the_day.on_deck).not_to eq(true)
      end

      it "should have changed the random prompt to the on deck prompt" do
        allow(Prompt).to receive(:random).and_return(random_prompt)

        service.call

        expect(random_prompt.on_deck).to eq(true)
      end
    end
  end
end
