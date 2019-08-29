

class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false],
    message: "%{value} is not valid" }
  validates :release_year, presence: true, if: :song_released?
  validate :cannot_release_in_future

  def song_released?
    released == true
  end

  def cannot_release_in_future
    if release_year.present? && release_year > DateTime.now.strftime('%Y').to_i
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
