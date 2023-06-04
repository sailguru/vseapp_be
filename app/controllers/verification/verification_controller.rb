class Verification::VerificationController < ApplicationController
    before_action :authorize_request, except: :check

    # POST /auth/verify
    def check
        if User.exists?(:phone => params[:phone])
            @user = User.find_by_phone(params[:phone])
          if @user.code == params[:code]
            token = Auth::JsonWebToken.encode(user_id: @user.id)
            time = Time.now
            @user.update(token: token, token_expr: time.strftime("%m-%d-%Y %H:%M"), code_expr: time.strftime("%m-%d-%Y %H:%M"))
            if @user.save!
              return render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                phone: @user.phone }, status: :accepted
            else
              render json: {errors: @user.errors.full_messages},
                     status: :unprocessable_entity
            end
          end
        end
      return render status: :precondition_failed
    end
end