# frozen_string_literal: true

require_relative '../../cm_challenge/services/calendar_description'
require_relative '../../cm_challenge/services/absence_list'

RSpec.describe CalendarDescription, 'Build description in icalendar' do
  subject { described_class.new(absence) }

  let(:absences_list) { AbsenceList.create }
  let(:absence) { absences_list[0] }

  describe '.initialize' do
    it 'initialize with single absence' do
      expect(subject.instance_variable_get(:@absence)).to eq(absence)
    end
  end

  describe '#create' do
    context 'when absence type is vacation' do
      before(:each) do
        absence[:type] = 'vacation'
      end

      it 'create a description with: member.name is on vacation' do
        expect(subject.create).to include('is on vacation')
      end
    end

    context 'when absence type is sickness' do
      before(:each) do
        absence[:type] = 'sickness'
      end

      it 'create a description with: member.name is sick' do
        expect(subject.create).to include('is sick')
      end
    end
  end
end
