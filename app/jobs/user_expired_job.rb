class UserExpiredJob < ActiveJob::Base
    queue_as :default

    def perform(*users)
        User.expired_code.expire_token
        User.expired_token.expire_code
    end

    #UserExpiredJob.perform_later
end