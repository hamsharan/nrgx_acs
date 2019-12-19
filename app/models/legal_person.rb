class LegalPerson < ApplicationRecord
  has_many :accounts

  validates :fantasy_name, presence: true
  validates :companyName, presence:true
  validates :fbn, presence: true, uniqueness: true,numericality:true
end
