class SignupsController < ApplicationController

  before_action :set_signup,
                only: %i[edit need_poeple_or_things need_things need_items
                         update time_form preview_and_publish]


  def index
    @signups = Signup.all
  end

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    if @signup.save
      if params[:from] == 'first_form'
        redirect_to signup_time_form_path(signup_id: @signup)
      elsif params[:from] == 'time_form'
        puts params[:from]
        redirect_to signup_need_poeple_or_things_path(signup_id: @signup)
      end
      # time_form
    else
      render :new
    end
    # @signup = Signup.new(signup_params)
    #
    # if @signup.save
    #   redirect_to signup_steps_path({:signup_id => @signup.id})
    # else
    #   render :new
    # end
  end

  def update
    if @signup.update_attributes(signup_params)
      if params[:from] == 'time_form'
        redirect_to signup_need_poeple_or_things_path(signup_id: @signup)
      elsif params[:from] == 'need_things'
        redirect_to  signup_preview_and_publish_path(signup_id: @signup)
      elsif params[:from] == 'need_items'
        redirect_to signup_preview_and_publish_path(signup_id: @signup)
      end
      # redirect_to edit_event_path(@event)
    else
      render :edit
    end
  end

  def need_poeple_or_things; end

  def time_form; end

  def need_things
    @item_type = params[:from]
    1.times { @signup.items.build }
    # 1.times { @signup.signup_items.build }
  end

  def preview_and_publish

  end

  private

  def signup_params
    params.require(:signup).permit(:title, :signup_type, :description, :image,
     items_attributes: %i(name amount start_time end_time _destroy id))
     # signup_items_attributes:
     #   %i(title quantity item_type start_time end_time _destroy id))
  end

  def set_signup
    @signup = nil
    @signup = Signup.find(params[:id]) if params[:id].present?
    @signup = Signup.find(params[:signup_id]) if params[:signup_id].present?
    redirect_to root_path, alert: 'Record not found!' if @signup.nil?
  end
end
