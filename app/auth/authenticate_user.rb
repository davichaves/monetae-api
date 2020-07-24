require 'json_web_token'

class AuthenticateUser

  prepend SimpleCommand
  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    return unless user

    JsonWebToken.encode(user_id: user.id)
  end

  private

  def user
    current_user = User.find_by(email: email)

    return current_user if current_user&.authenticate(password)

    errors.add(:user_authentication, 'Invalid credentials')
  end

end
