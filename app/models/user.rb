

class User < ActiveRecord::Base
  before_validation :reset_session_token

  def self.find_by_credentials(user_name, pw)
    u = User.find_by_user_name(user_name)
    if u.is_password?(pw)
      u
    else
      nil
    end
  end

  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def reset_session_token
    self.session_token ||= reset_session_token!
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
  end

end
