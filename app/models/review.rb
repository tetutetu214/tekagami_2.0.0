class Review < ApplicationRecord
  belongs_to :user
  belongs_to :prep
  belongs_to :task
  belongs_to :active
end
