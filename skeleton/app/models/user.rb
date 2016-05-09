class User < ActiveRecord::Base

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  #TODO

  attr_reader :password
  #TODO don't forget this

  has_many :links


  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password)? user : nil
    #TODO no space after ? for ternary!
  end

  def password=(password)
    @password = password
    self.password_digest=BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token
    token = SecureRandom.urlsafe_base64(16)
    self.session_token = token
    self.save!
    token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  #TODO must have or spec fails. can't save user.

end
