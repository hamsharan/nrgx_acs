class Api::V1::AccountsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def new_transaction
      amount = params[:amount]
      transaction_type = params[:transaction_type]
      account_id = params[:account_id]

      errors = ::Operations::ValidateNewTransaction.new(
          amount: amount,
          transaction_type: transaction_type,
          account_id: account_id
      ).execute!

      if errors.size > 0
          render json: { errors: errors }, status: 402
      else
          bank_account = ::Operations::PerformTransaction.new(
              amount: amount,
              transaction_type: transaction_type,
              primary_account_id: account_id
          ).execute!

          render json: { balance: account.balance }
      end
  end

  def index
    respond_with Account.all
  end

  def create
    respond_with :api, :v1, Account.create(account_params)
  end

  def destroy
    respond_with Account.destroy(params[:id])
  end

  def update
    account = Account.find(params["id"])
    account.update_attributes(account_params)
    respond_with account, json: account
  end

  private

  def account_params
    params.require(:account).permit(:id, :full_name, :sin,:birthdate)
  end
end
