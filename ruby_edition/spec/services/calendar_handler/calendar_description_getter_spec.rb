# frozen_string_literal: true

require_relative '../../../cm_challenge/services/calendar_handler/calendar_description_getter'
require_relative '../../../cm_challenge/services/absences_handler/absences_list_getter'
require_relative '../../../cm_challenge/api'

RSpec.describe CalendarHandler::CalendarDescriptionGetter, 'Build description in icalendar' do
  subject { described_class.new(absence) }
  let(:members) { CmChallenge::Api.members }
  let(:absences) { CmChallenge::Api.absences }
  let(:absences_list_getter_class) { AbsencesHandler::AbsencesListGetter }
  let(:absences_with_names) { absences_list_getter_class.new(absences, members).get }
  let(:absence) { absences_with_names[0] }

  describe '.initialize' do
    it 'initialize with absence' do
      expect(subject.instance_variable_get(:@absence)).to eq(absence)
    end
  end

  describe '#get' do
    context 'when absence type is vacation' do
      before(:each) do
        absence[:type] = 'vacation'
      end

      it 'get a description with member.name is on vacation' do
        expect(subject.get).to include('is on vacation')
      end
    end

    context 'when absence type is sickness' do
      before(:each) do
        absence[:type] = 'sickness'
      end

      it 'get a description with member.name is sick' do
        expect(subject.get).to include('is sick')
      end
    end
  end
end
