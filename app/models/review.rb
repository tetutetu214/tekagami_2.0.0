class Review < ApplicationRecord
  belongs_to :user
  belongs_to :prep
  belongs_to :task
  belongs_to :active

  with_options presence: true do
    validates :rev_1
    validates :rev_2
    validates :rev_3
    validates :rev_4

  end

end
