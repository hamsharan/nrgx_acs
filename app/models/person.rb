class Person < ApplicationRecord
  has_many :accounts

  validates :full_name, presence: true
  validates :sin, presence: true, uniqueness: true,numericality:true
  validates :birthdate,presence:true

end
