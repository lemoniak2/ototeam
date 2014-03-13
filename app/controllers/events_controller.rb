class EventsController < ApplicationController
  before_filter :require_login
  expose(:event, attributes: :event_params)
  expose(:q) {current_user.events.search(params[:q])}
  expose(:events) {q.result(distinct: true).order("name").page(params[:page]).per(10)}


  def create
    if event.save
      redirect_to event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if event.save
      redirect_to event, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def event_params
      params.require(:event).permit(:state, :name, :description, :start_at, :invite_from, :invite_to, :attendees_min_count, :attendees_max_count, :minutes_for_answer, :public_attendees_list, :creator_id)
    end
end
