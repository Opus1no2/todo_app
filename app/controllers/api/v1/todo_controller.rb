# frozen_string_literal: true

module Api
  module V1
    # Todo controller
    class TodoController < ApplicationController
      before_action :authenticate_v1_user!

      def update
        todo = Todo.find(params[:id])

        if todo.update!(completed_at: Time.current)
          render json: todo
        else
          render json: {}
        end
      end

      def create
        todo = Todo.create!(
          user_id: current_v1_user.id,
          list_id: params[:list_id],
          name: params[:name]
        )

        render json: todo
      end
    end
  end
end
