# frozen_string_literal: true

# # frozen_string_literal: true

require_relative '../../cm_challenge/absences'
require_relative '../../cm_challenge/controllers/absences_controller'
require_relative '../../cm_challenge/services/absences_handler/absences_list_getter'
require_relative '../../cm_challenge/services/calendar_handler/calendar_description_getter'
require_relative '../../cm_challenge/api.rb'

RSpec.describe CalendarsController, 'Handle CRUD actions of Canlenders' do
  subject { described_class.new }

  describe '#create_single_calendar' do
    it 'create a ics file for calender importation' do
      expect(subject.create_single_calendar).to be_instance_of(File)
    end
  end
end
