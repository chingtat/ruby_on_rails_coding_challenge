# frozen_string_literal: true

require_relative '../../cm_challenge/services/absence_list'

RSpec.describe AbsenceList, 'Build a list of absences with names' do
  let(:absence_list) { AbsenceList.create }

  describe '#create' do
    it 'get a list of absences with names' do
      expect(absence_list.find { |absence| absence[:name] }).to_not be_nil
    end
  end
end
