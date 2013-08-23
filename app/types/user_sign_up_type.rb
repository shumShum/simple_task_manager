class UserSignUpType < User
  include BaseType
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation

end