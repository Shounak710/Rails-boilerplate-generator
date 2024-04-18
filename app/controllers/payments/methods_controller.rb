# frozen_string_literal: true


class ::Payments::MethodsController < ApplicationController
before_action :set_method, only: [:show, :update, :destroy]

def index
use_case = ::Payments::Methods::IndexCase.new(
      filter_parameters: ,
      sort_params: ,
      page_parameters: page_parameters)

result = use_case.perform

render json: result.items,
                    meta: result.pagination,
                    meta_key: :pagination,
                    each_serializer: ::Payments::MethodsSerializer
end

def create
use_case = ::Payments::Methods::CreateCase.new(method_params.merge(account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Payments::MethodsSerializer, status: :created
end
end

def show
use_case = ::Payments::Methods::ShowCase.new(account: @account, id: @method.id)

result = use_case.perform

render json: result, serializer: ::Payments::MethodsSerializer
end

def update
use_case = ::Payments::Methods::UpdateCase.new(method_params.merge(id: @method.id, account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Payments::MethodsSerializer, status: :ok
end
end

def destroy
use_case = ::Payments::Methods::DestroyCase.new(id: @method.id, account: @account)

use_case.perform

if use_case.errors.any?
render json: { errors: use_case.errors }, status: :unprocessable_entity
else
head: :no_content
end
end

private

def method_params
params.require(:methods)
             .permit(:icon_name, :name)
end

def set_method
@method = @account.methods.find(params[:id])
end
end
