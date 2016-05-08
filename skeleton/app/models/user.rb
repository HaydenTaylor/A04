class User < ActiveRecord::Base

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  #TODO

  attr_reader :password
  #TODO don't forget this

  after_initialize :ensure_session_token


    def password=(password)
      self.password_digest=BCrypt::Password.create(password)
    end


  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  #TODO must have or spec fails. can't save user.

end
