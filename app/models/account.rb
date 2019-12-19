class Account < ApplicationRecord
    belongs_to :person
    belongs_to :legal_person
    has_many :accounts


    validates :balance, presence: true, numericality: true
end
