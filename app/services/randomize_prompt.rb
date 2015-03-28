class RandomizePrompt
  def call
    set_prompt_of_the_day
    new_random_prompt_on_deck
  end

  private

  def new_random_prompt_on_deck
    new_on_deck_prompt = Prompt.random
    new_on_deck_prompt.update(on_deck: true)
    Rails.logger.info "New on deck prompt: #{new_on_deck_prompt.content}"
  end

  def set_prompt_of_the_day
    old_on_deck_prompt = Prompt.on_deck
    old_on_deck_prompt.make_prompt_of_the_day!
    Rails.logger.info "New prompt of the day: #{old_on_deck_prompt.content}"
  end
end
