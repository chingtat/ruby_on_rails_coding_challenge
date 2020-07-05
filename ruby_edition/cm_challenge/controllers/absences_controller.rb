# frozen_string_literal: true

require 'date'

require_relative '../api'
require_relative '../services/absences_handler/absences_list_getter'

# Controller handling the CRUD actions for the absences
class AbsencesController
  def initialize(params)
    @params = params
    @absences = _get_list_of_absences
  end

  def filter_with_user_id
    result = []
    @absences.each do |absence|
      result.push(absence) if absence[:user_id] == @params['userId'].to_i
    end
    result
  end

  def filter_with_date_range
    result = []
    @absences.each do |absence|
      result.push(absence) if _check_start_date(absence) && _check_end_date(absence)
    end
    result
  end

  private

  def _get_list_of_absences
    members = CmChallenge::Api.members
    absences = CmChallenge::Api.absences
    AbsencesHandler::AbsencesListGetter.new(absences, members).get
  end

  def _check_start_date(absence)
    DateTime.parse(absence[:start_date]) >= DateTime.parse(@params[:startDate])
  end

  def _check_end_date(absence)
    DateTime.parse(absence[:end_date]) <= DateTime.parse(@params[:endDate])
  end
end
