class Person < ApplicationRecord
  has_many :accounts, through:user_account


  validates :full_name, presence: true
  validates :sin, presence: true, uniqueness: true,numericality:true
  validates :birthDate,presence:true

end
