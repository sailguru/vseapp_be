class User < ApplicationRecord
    has_secure_password
    #mount_uploader :avatar, AvatarUploader
    field :age, type: Integer
    field :address, type: String
    field :delivery_address, type: String
    field :role, type: Integer
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
  end