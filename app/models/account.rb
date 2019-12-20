class Account < ApplicationRecord
    has_one  :user_account
    has_many :accounts

    enum status: {cancelled:0, active:1, locked:2}

    validates :balance, presence: true, numericality: true
    validates :status, presence:true, inclusion: { in: statuses}

    before_validation :load_defaults

    def load_defaults
      if self.new_record?
        self.balance = 0.00
        self.status = 'active'
      end
    end
end
