class User < ApplicationRecord
    before_create :generate_verification_token

    has_many :cars

    def mark_as_verified!
        update(verified: true)
    end

    private

    def generate_verification_token
        self.verification_token = SecureRandom.urlsafe_base64
    end
end