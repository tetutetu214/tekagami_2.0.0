class Prep < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :now
    validates :target
  end

end
