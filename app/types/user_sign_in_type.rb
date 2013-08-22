class UserSignInType < User
  include BaseType

  attr_accessible :email, :password

  validates :email, presence: true
  validates :password, presence: true

end