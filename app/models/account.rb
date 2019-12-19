class Account < ApplicationRecord
    belongs :user_account
    has_many :accounts

    STATUS = ["cancelled","active","locked"]

    validates :balance, presence: true, numericality: true
    validates :status, presence:true,inclusion: { in: STATUS}

    before_validation :load_defaults

    def load_defaults
      if self.new_record?
        self.balance = 0.00
        self.status = 'active'
      end
    end
end
