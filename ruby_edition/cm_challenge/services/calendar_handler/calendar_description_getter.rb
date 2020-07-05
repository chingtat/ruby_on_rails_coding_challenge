# frozen_string_literal: true

module CalendarHandler
  # Class responsible of getting the description inside icalendars
  class CalendarDescriptionGetter
    def initialize(absence)
      @absence = absence
    end

    def get
      description = ''
      if @absence[:type] == 'vacation'
        description += "#{@absence[:name]} is on vacation."
      elsif @absence[:type] == 'sickness'
        description += "#{@absence[:name]} is sick."
      end
      description
    end
  end
end
