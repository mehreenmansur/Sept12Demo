class SignupStepsController < ApplicationController
  include Wicked::Wizard
  # steps :basic_info, :date_time, :need_people_or_things, :preferences, :preview_and_publish
  steps :date_time, :need_people_or_things, :preferences, :preview_and_publish

  def show
    @signup = Signup.find(params[:signup_id])
    render_wizard
  end

  def update
    @signup = Signup.find(params[:signup][:signup_id])
    @signup.attributes = signup_params

    if @signup.save
      redirect_to wizard_path(@next_step, {:signup_id => @signup.id})
    else
      redirect_to request.fullpath + "signup_id=#{@signup.id}"
    end

    # render_wizard @signup
  end

  private
  def signup_params
    params.require(:signup).permit(:start_date, :end_date)
  end
end
