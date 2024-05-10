# frozen_string_literal: true


class ::Api::Finances::TransactionsController < ApplicationController
before_action :set_transaction, only: [:show, :update, :destroy]

def index
use_case = ::Api::Finances::Transactions::IndexCase.new(
        filter_parameters: :method_id, :type, :account_id,
        sort_params: :amount, :date,
        page_parameters: page_parameters)

result = use_case.perform

render json: result.items,
                      meta: result.pagination,
                      meta_key: :pagination,
                      each_serializer: ::Api::Finances::TransactionSerializer
end

def create
use_case = ::Api::Finances::Transactions::CreateCase.new(transaction_params.merge(account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Api::Finances::TransactionSerializer, status: :created
end
end

def show
use_case = ::Api::Finances::Transactions::ShowCase.new(account: @account, id: @transaction.id)

result = use_case.perform

render json: result, serializer: ::Api::Finances::TransactionSerializer
end

def update
use_case = ::Api::Finances::Transactions::UpdateCase.new(transaction_params.merge(id: @transaction.id, account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Api::Finances::TransactionSerializer, status: :ok
end
end

def destroy
use_case = ::Api::Finances::Transactions::DestroyCase.new(id: @transaction.id, account: @account)

use_case.perform

if use_case.errors.any?
render json: { errors: use_case.errors }, status: :unprocessable_entity
else
head :no_content
end
end

private

def transaction_params
params.require(:transactions)
                    .permit(:amount, :memo, :method_id, :account_id, :id, :id, :id)
end

def filter_params
params.permit(:method_id, :type, :account_id)
end

def sort_parameters
params.permit(sort: [:amount, :date])
end

def set_transaction
@transaction = @account.transactions.find(params[:id])
end
end
