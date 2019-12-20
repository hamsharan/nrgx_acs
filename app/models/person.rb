class Person < ApplicationRecord
  has_many :accounts, through: UserAccount


  validates :full_name, presence: true
  validates :sin, presence: true, uniqueness: true,numericality:true
  validates :birthDate,presence:true

end
