# frozen_string_literal: true

require_relative '../../cm_challenge/controllers/absences_controller'

RSpec.describe CalendarsController, 'Handle CRUD actions of Canlenders' do
  let(:calendar) { CalendarsController.create }

  describe '#create' do
    it 'create a ics file' do
      expect(calendar).to be_instance_of(File)
      expect(File.basename(calendar)).to eq('iCal.ics')
    end
  end
end
