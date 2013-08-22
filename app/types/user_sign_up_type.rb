class UserSignUpType < User
  include BaseType
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation

  validates :password, presence: true,
                      on: :create,
                      length: {minimum: 6, maximum: 32}
  validates :email, presence: true,
                    uniqueness: true,
                    email: true
  validates :name, presence: true
end