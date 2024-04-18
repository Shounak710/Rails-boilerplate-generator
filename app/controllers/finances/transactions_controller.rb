# frozen_string_literal: true


class ::Finances::TransactionsController < ApplicationController
before_action :set_transaction, only: [:show, :update, :destroy]

def index
use_case = ::Finances::Transactions::IndexCase.new(
      filter_parameters: :method_id, :category_id,
      sort_params: ,
      page_parameters: page_parameters)

result = use_case.perform

render json: result.items,
                    meta: result.pagination,
                    meta_key: :pagination,
                    each_serializer: ::Finances::TransactionsSerializer
end

def create
use_case = ::Finances::Transactions::CreateCase.new(transaction_params.merge(account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Finances::TransactionsSerializer, status: :created
end
end

def show
use_case = ::Finances::Transactions::ShowCase.new(account: @account, id: @transaction.id)

result = use_case.perform

render json: result, serializer: ::Finances::TransactionsSerializer
end

private

def transaction_params
params.require(:transactions)
             .permit(:method_id, :category_id)
end

def filter_params
params.permit(:method_id, :category_id)
end

def set_transaction
@transaction = @account.transactions.find(params[:id])
end
end
