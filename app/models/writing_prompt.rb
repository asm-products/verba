class WritingPrompt < ActiveRecord::Base
  validates :prompt, uniqueness: true
end
