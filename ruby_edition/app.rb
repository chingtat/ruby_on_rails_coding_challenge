# frozen_string_literal: true

# Application API endpoint
require 'sinatra'
require_relative 'cm_challenge/controllers/absences_controller'
require_relative 'cm_challenge/controllers/calendars_controller'
require 'json'

set :port, 3000

get '/' do
  if !params[:userId].nil?
    response = AbsencesController.new(params).index_by_user_id
    response.to_json
  elsif !params[:startDate].nil? && !params[:endDate].nil?
    response = AbsencesController.new(params).index_by_date_range
    response.to_json
  else
    CalendarsController.create
    send_file './iCal.ics', filename: 'iCal.ics', type: 'Application/octet-stream'
  end
end
