class UserAccount < ApplicationRecord
  has_one :person
  has_one :legalPerson
  has_many :accounts
  has_many :Transactions, through:accounts
end
