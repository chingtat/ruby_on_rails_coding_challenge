# frozen_string_literal: true

module AbsencesHandler
  # Class responsible of getting a list of absences with names
  class AbsencesListGetter
    def initialize(absences, members)
      @absences = absences
      @members = members
    end

    def get
      name_hash = _get_name_hash
      @absences.each do |absence|
        absence[:name] = name_hash[absence[:user_id]] if name_hash.key?(absence[:user_id])
      end
      @absences
    end

    private

    def _get_name_hash
      name_hash = {}
      @members.each do |member|
        name_hash[member[:user_id]] = member[:name] unless name_hash.key?(member[:user_id])
      end
      name_hash
    end
  end
end
