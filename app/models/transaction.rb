class Transaction < ApplicationRecord
  belongs_to :accounts

  TRANSACTION_TYPES = ["transfer","deposit","contribution"]

  validates :primary_account_id, presence: true
  validates :type, presence:true,inclusion: { in: TRANSACTION_TYPES}
  validates :amount, presence: true, numericality:true
  validates :alphanumeric_code, uniqueness: true

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      self.alphanumeric_code =  (0...50).map { o[rand(o.length)] }.join
    end
  end


end
