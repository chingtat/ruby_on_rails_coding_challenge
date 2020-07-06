# frozen_string_literal: true

require 'icalendar'
require_relative '../cm_challenge/absences'

RSpec.describe CmChallenge::Absences, 'Create an icalendar' do
  let(:calendar) { CmChallenge::Absences.to_ical }

  describe '#to_ical' do
    it 'create an icalendar with events of absences' do
      expect(calendar).to be_a_kind_of(Icalendar::Calendar)
      expect(calendar.events).not_to be_empty
      expect(calendar.events.find(&:summary)).to_not be_nil
      expect(calendar.events.find(&:description)).to_not be_nil
      expect(calendar.events.find(&:dtstart)).to_not be_nil
      expect(calendar.events.find(&:dtend)).to_not be_nil
    end
  end
end
