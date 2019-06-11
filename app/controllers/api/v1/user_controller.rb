# frozen_string_literal: true

module Api
  module V1
    # User controller
    class UserController < ApplicationController
      def create
        user = User.new(
          email: permitted_params[:email],
          password: permitted_params[:password]
        )

        if user.save
          render json: user
        else
          render json: user.errors.messages, status: :unprocessable_entity
        end
      end

      def permitted_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
