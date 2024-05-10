# frozen_string_literal: true


class ::Therapists::Branches::ReservationsController < ApplicationController
before_action :set_reservation, only: [:show, :update, :destroy]

def index
use_case = ::Therapists::Branches::Reservations::IndexCase.new(
        filter_parameters: :branch_id, :therapist_id, :start_time, :end_time,
        sort_params: :start_time, :branch_id, :therapist_id,
        page_parameters: page_parameters)

result = use_case.perform

render json: result.items,
                      meta: result.pagination,
                      meta_key: :pagination,
                      each_serializer: ::Therapists::Branches::ReservationsSerializer
end

def create
use_case = ::Therapists::Branches::Reservations::CreateCase.new(reservation_params.merge(account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Therapists::Branches::ReservationsSerializer, status: :created
end
end

def show
use_case = ::Therapists::Branches::Reservations::ShowCase.new(account: @account, id: @reservation.id)

result = use_case.perform

render json: result, serializer: ::Therapists::Branches::ReservationsSerializer
end

def update
use_case = ::Therapists::Branches::Reservations::UpdateCase.new(reservation_params.merge(id: @reservation.id, account: @account))

result = use_case.perform

if result.errors.any?
render json: { errors: result.errors }, status: :unprocessable_entity
else
render json: result.record, serializer: ::Therapists::Branches::ReservationsSerializer, status: :ok
end
end

def destroy
use_case = ::Therapists::Branches::Reservations::DestroyCase.new(id: @reservation.id, account: @account)

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
                    .permit(:start_time, :end_time, :branch_id, :therapist_id)
end

def filter_params
params.permit(:branch_id, :therapist_id, :start_time, :end_time)
end

def sort_parameters
params.permit(sort: [:start_time, :branch_id, :therapist_id])
end

def set_reservation
@reservation = @account.reservations.find(params[:id])
end
end
