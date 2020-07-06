# frozen_string_literal: true

# Class responsible of creating a list of absences with names
class AbsenceList
  class << self
    def create
      absences = _get_absences
      name_hash = _get_name_hash
      absences.each do |absence|
        absence[:name] = name_hash[absence[:user_id]] if name_hash.key?(absence[:user_id])
      end
      absences
    end

    private

    def _get_name_hash
      members = _get_members
      name_hash = {}
      members.each do |member|
        name_hash[member[:user_id]] = member[:name] unless name_hash.key?(member[:user_id])
      end
      name_hash
    end

    def _get_absences
      CmChallenge::Api.absences
    end

    def _get_members
      CmChallenge::Api.members
    end
  end
end
