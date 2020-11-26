class Active < ApplicationRecord
  belongs_to :user
  belongs_to :prep
  belongs_to :task

  with_options presence: true do
    validates :way_1
    validates :way_2
    validates :way_3
  end

end
