class SignupsController < ApplicationController

  def index
    @signups = Signup.all
  end
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to signup_steps_path({:signup_id => @signup.id})
    else
      render :new
    end
  end

  private
  def signup_params
    params.require(:signup).permit(:title, :signup_type, :description)
  end
end
