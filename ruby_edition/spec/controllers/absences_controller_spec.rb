# frozen_string_literal: true

require 'date'
require_relative '../../cm_challenge/controllers/absences_controller'

RSpec.describe AbsencesController, 'Handle CRUD actions of Absences' do
  subject { described_class.new(params) }

  let(:params) do
    { userId: '2664', startDate: '2017-01-01', endDate: '2017-02-01' }
  end
  let(:params_start_date) { Date.parse(params[:startDate]) }
  let(:params_end_date) { Date.parse(params[:endDate]) }

  describe '.initialize' do
    it 'initialize with params' do
      expect(subject.instance_variable_get(:@params)).to eq(params)
    end
  end

  describe '#index_by_user_id' do
    it 'get a list of abseces with same user_id' do
      expect(subject.index_by_user_id).to all(have_value(2664))
    end
  end

  describe '#index_by_date_range' do
    it 'get a list of abseces within the date range' do
      expect(subject.index_by_date_range).not_to be_empty
      subject.index_by_date_range.each do |absence|
        absence_start_date = absence[:start_date]
        absence_end_date = absence[:end_date]
        expect(Date.parse(absence_start_date)).to be >= params_start_date
        expect(Date.parse(absence_end_date)).to be <= params_end_date
      end
    end
  end
end
