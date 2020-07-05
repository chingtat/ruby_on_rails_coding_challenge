# frozen_string_literal: true

require_relative '../../../cm_challenge/services/absences_handler/absences_list_getter'
require_relative '../../../cm_challenge/api'

RSpec.describe AbsencesHandler::AbsencesListGetter, 'Build a list of absences with names' do
  subject { described_class.new(absences, members) }
  let(:members) { CmChallenge::Api.members }
  let(:absences) { CmChallenge::Api.absences }

  describe '.initialize' do
    it 'initialize with absences and members' do
      expect(subject.instance_variable_get(:@absences)).to eq(absences)
      expect(subject.instance_variable_get(:@members)).to eq(members)
    end
  end

  describe '#get' do
    it 'get a list of absences with names' do
      expect(subject.get).to all(have_key(:name))
    end
  end
end
