class DateValidator < ActiveModel::Validator
    def validate(record)
        if record.release_year.nil? && record.released
            record.errors.add(:release_year, "You need to add a release year.")
        end

        current_year = Time.now.year
        if record.released && !record.release_year.nil?
            if Time.now.year < record.release_year
                record.errors.add(:release_year, "The release year cannot be in the future.")
            end
        end
    end
end