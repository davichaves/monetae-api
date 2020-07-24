require 'jwt'

class JsonWebToken

  class << self

    SECRET_KEY = Rails.application.credentials.secret_key_base

    def encode(payload)
      payload.reverse_merge!(meta)

      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      JWT.decode(token, SECRET_KEY).first
    end

    def meta
      { exp: 7.days.from_now.to_i }
    end

  end

end
