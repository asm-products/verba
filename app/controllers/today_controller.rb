class TodayController < AuthenticatedController
  def show
    @post_today = current_user.posts.today
    @profile = Profile.new(current_user, view_context)
    @prompt = Prompt.today
  end

  def get_synonyms
    @response = GetSynonyms.call(params[:word]).body["synonyms"].to_json

    respond_to do |format|
      format.js
    end
  end
end
