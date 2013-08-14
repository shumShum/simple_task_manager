class UserSignUpType < User
  include BaseType

  has_secure_password

  permit :name, :email, :password, :password_confirmation

end
