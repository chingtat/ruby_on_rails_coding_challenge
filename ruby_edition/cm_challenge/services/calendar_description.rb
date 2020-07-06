# frozen_string_literal: true

# Class responsible of creating the description inside icalendars
class CalendarDescription
  def initialize(absence)
    @absence = absence
  end

  def create
    description = ''
    if @absence[:type] == 'vacation'
      description += "#{@absence[:name]} is on vacation."
    elsif @absence[:type] == 'sickness'
      description += "#{@absence[:name]} is sick."
    end
    description
  end
end
