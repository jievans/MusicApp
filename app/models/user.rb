class User < ActiveRecord::Base
  attr_accessible :activation_token, :email, :password, :token
  before_validation :generate_activation_token,
                    :generate_token,
                    :on => :create
  validates :email, :password, :presence => true
  validates :email, :uniqueness => true

  def generate_activation_token
    self.activation_token = SecureRandom.urlsafe_base64
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

end
