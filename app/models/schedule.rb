class Schedule < ApplicationRecord
    validates :title, presence: true,length: {maximum: 20}
    validates :start, presence: true
    validates :finish, presence: true
    validates :memo, length: {maximum: 500}
end
