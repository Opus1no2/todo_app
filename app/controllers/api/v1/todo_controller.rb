# frozen_string_literal: true

module Api
  module V1
    # Todo controller
    class TodoController < ApplicationController
      before_action :authenticate_v1_user!

      def update
        todo = Todo.find(permitted_params[:id])

        if todo.update!(completed_at: Time.current)
          render json: todo
        else
          render json: {}
        end
      end

      def create
        todo = Todo.new(
          user_id: current_v1_user.id,
          list_id: permitted_params[:list_id],
          name: permitted_params[:name]
        )

        if todo.save
          render json: todo
        else
          render json: todo.errors.messages, status: :unprocessable_entity
        end
      end

      def permitted_params
        params.permit(:name, :id, :list_id)
      end
    end
  end
end
