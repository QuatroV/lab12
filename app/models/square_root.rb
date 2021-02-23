class SquareRoot < ApplicationRecord
    validates :num, presence: true, uniqueness: true
    validates :res, presence: true
end
