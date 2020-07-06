# frozen_string_literal: true

require_relative '../absences'

# Controller handling the CRUD actions for the calendars
class CalendarsController
  class << self
    def create
      calendar = CmChallenge::Absences.to_ical
      cal_file = File.open('iCal.ics', 'w+')
      cal_file.puts(calendar.to_ical)
      cal_file.close
      cal_file
    end
  end
end
