class UsersController < AuthenticatedController
  skip_before_action :require_user, only: [:new, :create]
  skip_before_action :require_subscriber, only: [:new, :create, :edit]

  def index
    @profile = Profile.new(current_user, view_context)
    @users = User.all.order("longest_streak DESC")
      .paginate(page: params[:page], per_page: 50)
  end

  def new
    @user = User.new
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @profile = Profile.new(@user, view_context)
  end

  def stats
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @profile = Profile.new(@user, view_context)
  end

  def edit
    @profile = Profile.new(current_user, view_context)
  end

  def update
    @user = current_user
    @user.skip_password_validation = true

    if @user.update(settings_params)
      redirect_to user_path(@user)
    else
      @profile = Profile.new(@user, view_context)
      render :edit
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      WelcomeEmailJob.perform_later(@user)
      set_current_user(@user.id)
      redirect_to welcome_path
    else
      render :new
    end
  end

  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :unsubscribe)
  end

  def settings_params
    params.require(:user).permit(:email, :unsubscribe)
  end
end
