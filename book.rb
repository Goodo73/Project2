class Book < ActiveRecord::Base
  belongs_to :genre
  belongs_to :format
  belongs_to :category

  scope :loaned, -> { where.not(loaned_to: '') }
  scope :unloaned, -> { where(loaned_to: '') }
end