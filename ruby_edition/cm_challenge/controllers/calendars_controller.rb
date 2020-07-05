# frozen_string_literal: true

require 'iCalendar'
require 'date'

require_relative '../api'
require_relative '../absences'
require_relative '../services/absences_handler/absences_list_getter'
require_relative '../services/calendar_handler/calendar_description_getter'

# Controller handling the CRUD actions for the calendars
class CalendarsController
  def initialize
    @absences = _get_list_of_absences
    @description_getter = _get_description_getter
  end

  def create_single_calendar
    calendar = CmChallenge::Absences.new(@absences, @description_getter).to_ical
    cal_file = File.open('iCal.ics', 'w+')
    cal_file.puts(calendar.to_ical)
    cal_file.close
    cal_file
  end

  private

  def _get_list_of_absences
    members = CmChallenge::Api.members
    absences = CmChallenge::Api.absences
    AbsencesHandler::AbsencesListGetter.new(absences, members).get
  end

  def _get_description_getter
    CalendarHandler::CalendarDescriptionGetter
  end
end
