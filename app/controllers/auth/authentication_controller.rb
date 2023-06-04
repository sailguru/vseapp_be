class Auth::AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    # POST /auth/login
    def login
      unless User.exists?(:phone => params[:phone])
        @user = User.new(:phone => params[:phone])
      else
        @user = User.find_by_phone(params[:phone])
      end
      generator = self.class.get_generator()
      code = self.class.get_code(generator)
      #smsSender.send(self.class.get_message(generator, code))
      @user.update(code: code)
      if @user.save!
        render json: {code: code}, status: :accepted
      else
        render json: {errors: @user.errors.full_messages},
               status: :unprocessable_entity
      end
    end
  
    private
  
    def login_params
      params.permit(:phone, :token, :code)
    end

    def self.get_generator
      return Verification::CodeGenerator.new
    end

    def self.get_code(generator)
      return generator.generate_code(2)
    end

    def self.get_message(generator, code)
      return generator.generate_sms_message(code)
    end
  end