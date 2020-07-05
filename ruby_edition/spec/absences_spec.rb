# frozen_string_literal: true

require 'icalendar'
require_relative '../cm_challenge/absences'
require_relative '../cm_challenge/services/absences_handler/absences_list_getter'
require_relative '../cm_challenge/services/calendar_handler/calendar_description_getter'
require_relative '../cm_challenge/api'

RSpec.describe CmChallenge::Absences, 'Build a icalendar' do
  subject { described_class.new(absences_list, description_getter) }
  let(:members) { CmChallenge::Api.members }
  let(:absences) { CmChallenge::Api.absences }
  let(:absences_list_getter_class) { AbsencesHandler::AbsencesListGetter }
  let(:description_getter) { CalendarHandler::CalendarDescriptionGetter }
  let(:absences_list) { absences_list_getter_class.new(absences, members).get }
  let(:icalendar) { Icalendar::Calendar }

  describe '.initialize' do
    it 'initialize with absences_list and description_getter' do
      expect(subject.instance_variable_get(:@absences_list)).to eq(absences_list)
      expect(subject.instance_variable_get(:@description_getter)).to eq(description_getter)
    end
  end

  describe '#to_ical' do
    it 'get an icalendar with events of absences' do
      expect(subject.to_ical).to be_a_kind_of(icalendar)
      expect(subject.to_ical.events).not_to be_empty
    end
  end
end
