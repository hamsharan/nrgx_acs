module Operations
  class ValidateNewTransaction
    def initialize(amount: , transaction_type: , primary_account_id:,secondary_account_id: )
        @amount = amount.try(:to_i)
        @transaction_type = transaction_type
        @account_id = primary_account_id
        @account = Account.where(id: @primary_account_id).first
        @secondary_account_id = secondary_account_id
        @secondary_account = Account.where(id:@secondary_account_id).first
        @errors = []
    end

    def execute!
        validate_existence_of_account!
        if @account.status in ["locked","cancelled"]
          @errors << "ACCOUNT IS LOCKED or cancelled cannot perform the transactions"
        end
        if @transaction_type == "contribution" and @account.present?
            validate_contribution!
        elsif @transaction_type == 'deposit' and @account.present?
          validate_deposit!
        elsif @transaction_type == 'transfer' and @account.present?
          validate_transfer!
        end
        @errors
    end

    private

    def validate_contribution!
        if @account.branch_account?
            @errors << "Can only contribute to parent account"
        end
    end
    def validate_deposit!
        if !@account.branch_account?
            @errors << "deposits only allowed to branch accounts"
        end
        if !(@account.status == 'active')
          @errors<< "only active branch accounts can accept deposits"
        end
    end
    def validate_transfer!
      if @account.status == "locked"
        @errors << "Account is locked, and therefore can not transfer funds"
      end
      if @secondary_account.parent_account_id != @account.parent_account_id
        @errors << "Cant transfer unless the accounts belong to same heirarchy. Aka belong to same parent account"
      end

      if !@secondary_account.branch_account?
        @errors<< "Can not transfer to a parent account"
      end
      if @secondary_account_id.status == '!active'
        @errors<< "only active branch accounts can accept transfers"
      end
      if @account.balance - @amount < 0
        @errors<< "Not enough funds to transfer"
      end

    end


    def validate_existence_of_account!
        if @account.blank?
            @errors << "Account not found"
        end

    end
  end
end
