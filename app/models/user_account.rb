class UserAccount < ApplicationRecord
  has_one :person
  has_one :legal_person
  has_many :accounts
  has_many :Transactions, through:Account
end
