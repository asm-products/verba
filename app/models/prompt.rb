class Prompt < ActiveRecord::Base
  validates :content, presence: true

  def make_prompt_of_the_day!
    current_prompt = Prompt.find_by(prompt_of_the_day: true)
    displace_prompt(current_prompt)
    update(prompt_of_the_day: true, used: true)
  end

  private

  def displace_prompt(prompt)
    return unless prompt
    prompt.update(prompt_of_the_day: false)
  end
end
