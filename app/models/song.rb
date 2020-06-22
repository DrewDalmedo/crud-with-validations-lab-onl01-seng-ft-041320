class Song < ApplicationRecord
    validates :title, presence: true
    validates_with DateValidator
    validate :song_by_artist_already_exists
    '''
    validates :release_year, presence: true, if: :is_released
    validate :released_in_past_or_present
    '''

    private

    def song_by_artist_already_exists
        temp_song = Song.find_by(title: self.title)
        
        if !temp_song.nil?

            if temp_song.artist_name == self.artist_name
                errors.add(:artist_name, "Song by artist already exists.")
            end

        end
        
    end
end
