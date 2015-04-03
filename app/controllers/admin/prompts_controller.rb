class Admin::PromptsController < AdminController
  def index
    @prompts = Prompt.all
  end
end
