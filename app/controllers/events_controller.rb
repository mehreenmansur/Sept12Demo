# frozen_string_literal: true

class EventsController < ApplicationController

  before_action :index_breadcrumb, only: %i[index new edit create]
  before_action :new_breadcrumb, only: %i[create]
  before_action :set_event,
    only: %i[edit need_poeple_or_things need_things need_items update time_form preview_and_publish]

  def index
    # records = params[:per_page_records] || Event::ELEMENT_PER_PAGE[0]
    # @events_for = if params[:club_id].present?
    #                 Event.where(club_id: params[:club_id])
    #                      .order('created_at DESC')
    #               elsif params[:on_campus_id].present?
    #                 Event.where(on_campus_id: params[:on_campus_id])
    #                      .order('created_at DESC')
    #               else
    #                 Event.all.order('created_at DESC')
    #               end
    # @events = @events_for.paginate(page: params[:page], per_page: records)
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def new
    @event = Event.new
    # add_breadcrumb 'New Event', new_event_path
  end

  def edit
    # redirect_to event_time_form_path(event_id: @event)
    # add_breadcrumb 'Edit Event', edit_event_path
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      if params[:from] == 'first_form'
        redirect_to event_time_form_path(event_id: @event)
      elsif params[:from] == 'time_form'
        puts params[:from]
        redirect_to event_need_poeple_or_things_path(event_id: @event)
      end
      # time_form
    else
      render :new
    end
  end

  def update
    if @event.update_attributes(event_params)
      if params[:from] == 'time_form'
        redirect_to event_need_poeple_or_things_path(event_id: @event)
      elsif params[:from] == 'need_things'
        redirect_to  event_need_items_path(event_id: @event)
      elsif params[:from] == 'need_items'
        redirect_to event_preview_and_publish_path(event_id: @event)
      end
      # redirect_to edit_event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      event_check
    else
      render :index
    end
  end

  def show; end

  def time_form
    puts 'here------------'
    puts @event.start_time
    puts @event.id
  end

  def need_poeple_or_things

  end

  def need_items
    3.times { @event.items.build }
  end

  def need_things
    3.times { @event.things.build }
  end

  def preview_and_publish

  end

  private

  def filter(category, date, faculty)
    return Event.public_send(Event::EVENT_CATEGORY.key(category)) if category.present?

    if date.present?
      @selected_date = date
      return Event.on_date(date.to_date)
    elsif faculty.present?
      Faculty.friendly.find(faculty).events
    end
  end

  def index_breadcrumb
    # if params[:club_id].present?
    #   add_breadcrumb 'Clubs', clubs_path
    #   add_breadcrumb Club.find(params[:club_id]).name,
    #                  edit_club_path(id: params[:club_id])
    #   add_breadcrumb 'Events'
    # elsif params[:on_campus_id].present?
    #   add_breadcrumb 'On Campus', on_campus_path
    #   add_breadcrumb OnCampus.find(params[:on_campus_id]).name,
    #                  edit_on_campu_path(id: params[:on_campus_id])
    #   add_breadcrumb 'Events'
    # else
    #   add_breadcrumb 'Events', events_path
    # end
  end

  def new_breadcrumb
    # add_breadcrumb 'New Event', new_event_path
  end

  def event_params
    params.require(:event).permit(
      :title, :category, :welcome_message, :image, :file, :start_time, :end_time,
      things_attributes: %i(name amount start_time end_time _destroy id),
      items_attributes: %i(name amount start_time end_time _destroy id)
      # event_people_attributes: %i(name amount start_time end_time _destroy id)
    )
  end

  def set_event
    @event = nil
    @event = Event.find(params[:id]) if params[:id].present?
    @event = Event.find(params[:event_id]) if params[:event_id].present?
    redirect_to root_path, alert: 'Record not found!' if @event.nil?
  end
end
