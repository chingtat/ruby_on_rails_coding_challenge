# frozen_string_literal: true

require 'icalendar'

require_relative './api'

module CmChallenge
  # Class responsible of generating the ical file
  class Absences
    def initialize(absences_list, description_getter)
      @absences_list = absences_list
      @description_getter = description_getter
    end

    def to_ical
      calendar = Icalendar::Calendar.new
      calendar.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
      calendar.version = '2.0'
      _add_event_to_calendar(calendar)
      calendar
    end

    private

    def _add_event_to_calendar(calendar)
      @absences_list.each do |absence|
        event = Icalendar::Event.new
        event.summary = 'Absences'
        event.dtstart = Icalendar::Values::Date.new(absence[:start_date].tr('-', ''))
        event.dtend = Icalendar::Values::Date.new(absence[:end_date].tr('-', ''))
        event.description = @description_getter.new(absence).get
        calendar.add_event(event)
      end
    end
  end
end
