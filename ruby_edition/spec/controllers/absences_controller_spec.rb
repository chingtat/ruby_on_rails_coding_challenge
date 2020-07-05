# frozen_string_literal: true

require_relative '../../cm_challenge/absences'
require_relative '../../cm_challenge/controllers/absences_controller'
require_relative '../../cm_challenge/services/absences_handler/absences_list_getter'
require_relative '../../cm_challenge/services/calendar_handler/calendar_description_getter'
require_relative '../../cm_challenge/api.rb'

RSpec.describe AbsencesController, 'Handle CRUD actions of absences' do
  subject { described_class.new(params) }
  let(:members) { CmChallenge::Api.members }
  let(:absences) { CmChallenge::Api.absences }
  let(:absences_list_getter_class) { AbsencesHandler::AbsencesListGetter }
  let(:absences_list) { absences_list_getter_class.new(absences, members).get }
  let(:params) do
    { userId: '2664', startDate: '2017-01-01', endDate: '2017-02-01' }
  end

  describe '.initialize' do
    it 'initialize with params' do
      expect(subject.instance_variable_get(:@params)).to eq(params)
    end
  end

  describe '#filter_with_user_id' do
    it 'filter the absences list with the user_id' do
      expect(subject.filter_with_user_id).to all(have_value(2664))
    end
  end

  describe '#filter_with_date_range' do
    it 'filter the absences list with the date range' do
      expect(subject.filter_with_date_range).not_to be_empty
    end
  end
end
