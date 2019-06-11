# frozen_string_literal: true

module Api
  module V1
    # List controller
    class ListController < ApplicationController
      before_action :authenticate_v1_user!

      def index
        list = List.where(user_id: current_v1_user.id).first
        render json: { id: list.id, todos: list.todos }
      end

      def show
        render json: List.where(user_id: current_v1_user.id, id: params[:id])
      end
    end
  end
end
