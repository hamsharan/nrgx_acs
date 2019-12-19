module Operations
  class PerformTransaction
    def initialize(amount: , transaction_type: , primary_account_id: ,secondary_account_id:)
        @amount = amount.to_f
        @transaction_type = transaction_type
        @primary_account_id = primary_account_id
        @secondary_account_id = secondary_account_id
        @account = Account.where(id: @primary_account_id).first
        @secondary_account = Account.where(id: @secondary_account_id).first
    end

    def execute!()
        ActiveRecord::Base.transaction do
            Transaction.create!(
                primary_account_id: @primary_account_id,
                amount: @amount,
                transaction_type: @transaction_type,
                secondary_account_id: @secondary_account_id,

            )

            if @transaction_type == "contribution" and !@account.branch_account?
                @account.update!(balance: @account.balance.to_f + @amount)
            elsif @transaction_type == "deposit" and @account.branch_account?
                @account.update!(balance: @account.balance.to_f + @amount)
            elsif @transaction_type == "transfer" and @secondary_account.branch_account?
                @account.update!(balance:@account.balance.to_f - @amount)
                @secondary_account.update!(balance:@secondary_account.balance.to_f + @amount)
            end
        end

        @account
    end

    private

  end
end
