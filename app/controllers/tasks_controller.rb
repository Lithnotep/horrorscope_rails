require "google/apis/calendar_v3"
require "google/api_client/client_secrets.rb"

class TasksController < ApplicationController
  CALENDAR_ID = 'primary'

  def new
    date = current_user.personal_messages.last.description[-10..-1]

    year = date[0..3]
    month = date[5..6]
    day = date[8..9]
    formatted_date = "#{month}-#{day}-#{year}"
    @cal_date = DateTime.parse(formatted_date)
    @description = current_user.personal_messages.last.description
    @task = Task.new
  end

  def create
    client = get_google_calendar_client current_user
    task = params[:task]
    event = get_event task
    client.insert_event('primary', event)
    flash[:success] = 'DOOMSDAY HAS BEEN ADDED TO YOUR CALENDAR. PREPARE ACCORDINGLY.'
    redirect_to personal_path
  end

  def get_google_calendar_client current_user
    client = Google::Apis::CalendarV3::CalendarService.new
    return unless (current_user.present? && current_user.google_token.present? && current_user.google_refresh_token.present?)
    secrets = Google::APIClient::ClientSecrets.new({
      "web" => {
        "access_token" => current_user.google_token,
        "refresh_token" => current_user.google_refresh_token,
        "client_id" => ENV["GOOGLE_API_KEY"],
        "client_secret" => ENV["GOOGLE_API_SECRET"]
      }
    })
    begin
      client.authorization = secrets.to_authorization
      client.authorization.grant_type = "refresh_token"

      if !current_user.present?
        client.authorization.refresh!
        current_user.update_attributes(
          access_token: client.authorization.access_token,
          refresh_token: client.authorization.refresh_token,
          expires_at: client.authorization.expires_at.to_i
        )
      end
    rescue => e
      flash[:error] = 'Your token has been expired. Please login again with google.'
      redirect_to :back
    end
    client
  end

  private

  def get_event task
    date = current_user.personal_messages.last.description[-10..-1]

    year = date[0..3]
    month = date[5..6]
    day = date[8..9]
    formatted_date = "#{month}-#{day}-#{year}"
    @cal_date = DateTime.parse(formatted_date)
    event = Google::Apis::CalendarV3::Event.new({
      summary: task[:title],
      location: '800 Howard St., San Francisco, CA 94103',
      description: task[:description],
      start: {
        date_time: @cal_date,
        time_zone: "America/Los_Angeles"

      },
      end: {
        date_time: @cal_date,
        time_zone: "America/Los_Angeles"
      },

      reminders: {
        use_default: false,
        overrides: [
          Google::Apis::CalendarV3::EventReminder.new(reminder_method:"popup", minutes: 10),
          Google::Apis::CalendarV3::EventReminder.new(reminder_method:"email", minutes: 20)
        ]
      },
      notification_settings: {
        notifications: [
                        {type: 'event_creation', method: 'email'},
                        {type: 'event_change', method: 'email'},
                        {type: 'event_cancellation', method: 'email'},
                        {type: 'event_response', method: 'email'}
                       ]
      }, 'primary': true
    })
  end
end
