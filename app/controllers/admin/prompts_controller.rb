class Admin::PromptsController < AdminController
  def index
    @prompts = Prompt.all.order(used: :asc)
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.new(prompt_params)
    @prompt.save!

    redirect_to admin_prompts_path
  end

  private

  def prompt_params
    params.require(:prompt).permit(:content)
  end
end
