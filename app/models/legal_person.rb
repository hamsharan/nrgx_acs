class LegalPerson < ApplicationRecord
  has_many :accounts, through:user_account
  belongs_to :user_account

  validates :fantasy_name, presence: true
  validates :companyName, presence:true
  validates :fbn, presence: true, uniqueness: true,numericality:true
end
