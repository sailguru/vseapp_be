class User < ApplicationRecord
    #has_secure_password
    #mount_uploader :avatar, AvatarUploader

    #attr_accessor :name, :address, :delivery_address, :role, :avatar, :token, :code

    validates :email, presence: false
    validates :phone, presence: true, uniqueness: true
    #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, format: { with: /((?:\+?|\b)[0-9]{10}\b)/i }
    validates :username, presence: false
    validates_uniqueness_of :email, :allow_blank => true
    validates_uniqueness_of :username, :allow_blank => true

    #scopes
    scope :expired_token, -> { where('token_expr >= ?', 24.hours.ago) }
    scope :expired_code, -> { where('code_expr >= ?', 10.minutes.ago) }

    def self.expire_token
      @user.expired_token.update(token: null).save!
    end

    def self.expire_code
      @user.expired_code.update(code: null).save!
    end
  end