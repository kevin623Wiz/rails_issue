class Schedule < ApplicationRecord
    validates :title, presence: true, length: {maximum: 20}
    validates :start, presence: true
    validates :finish, presence: true
    validates :memo, length: {maximum: 500}

    # カスタムエラーメッセージ
    validate :start_end_error
    def start_end_error
        if start != nil && finish != nil && start > finish
            errors.add(:finish, "の日付を正しく記入してください")
        end
    end
end
