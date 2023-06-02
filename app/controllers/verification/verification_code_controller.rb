class VerificationCodeController < ApplicationController
    before_action :authorize_request, except: :sms_code

    # GET /auth/sms/code
    def sms_code
        code = rand(10 ** 6)
        render json: { code: code}, status: :ok
    end

    # GET /auth/mail/code
    def mail_code
      code = rand(10 ** 6)
      render json: { code: code}, status: :ok
    end

    def get_code
      return rand(10 ** 6)
    end

  end