# frozen_string_literal: true

require 'icalendar'

require_relative './api'
require_relative './services/absence_list'
require_relative './services/calendar_description'

module CmChallenge
  # Class responsible of generating the ical file
  class Absences
    class << self
      def to_ical
        calendar = Icalendar::Calendar.new
        calendar.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
        calendar.version = '2.0'
        _add_event_to_calendar(calendar)
        calendar
      end

      private

      def _add_event_to_calendar(calendar)
        absence_list = AbsenceList.create
        absence_list.each do |absence|
          event = Icalendar::Event.new
          event.summary = 'Absences'
          event.dtstart = Icalendar::Values::Date.new(absence[:start_date].tr('-', ''))
          event.dtend = Icalendar::Values::Date.new(absence[:end_date].tr('-', ''))
          event.description = CalendarDescription.new(absence).create
          calendar.add_event(event)
        end
      end
    end
  end
end
