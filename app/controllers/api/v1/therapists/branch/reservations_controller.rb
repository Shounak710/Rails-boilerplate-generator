# frozen_string_literal: true


class ::Api::V1::Therapists::Branch::ReservationsController < ApplicationController
before_action :set_reservation, only: [:show, :update, :destroy]

def index
use_case = ::Api::V1::Therapists::Branch::Reservations::IndexCase.new(
        filter_parameters: :branch_id, :end_time, :item_ids, :product_ids, :start_time, :therapist_id,
        sort_params: :branch_id, :end_time, :start_time,
        page_parameters: page_parameters)

result = use_case.perform

render json: result.items,
                      meta: result.pagination,
                      meta_key: :pagination,
                      each_serializer: ::Api::V1::Therapists::Branch::ReservationSerializer
end

def create
use_case = ::Api::V1::Therapists::Branch::Reservations::CreateCase.new(reservation_params.merge(account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Api::V1::Therapists::Branch::ReservationSerializer, status: :created
end
end

def show
use_case = ::Api::V1::Therapists::Branch::Reservations::ShowCase.new(account: @account, id: @reservation.id)

result = use_case.perform

render json: result, serializer: ::Api::V1::Therapists::Branch::ReservationSerializer
end

def update
use_case = ::Api::V1::Therapists::Branch::Reservations::UpdateCase.new(reservation_params.merge(id: @reservation.id, account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Api::V1::Therapists::Branch::ReservationSerializer, status: :ok
end
end

def destroy
use_case = ::Api::V1::Therapists::Branch::Reservations::DestroyCase.new(id: @reservation.id, account: @account)

use_case.perform

if use_case.errors.any?
render json: { errors: use_case.errors }, status: :unprocessable_entity
else
head :no_content
end
end

private

def reservation_params
params.require(:reservation)
                    .permit(:branch_id, :end_time, :id, :item_ids, :product_ids, :start_time, :therapist_id)
end

def filter_params
params.permit(:branch_id, :end_time, :item_ids, :product_ids, :start_time, :therapist_id)
end

def sort_parameters
params.permit(sort: [:branch_id, :end_time, :start_time])
end

def set_reservation
@reservation = @account.reservations.find(params[:id])
end
end
