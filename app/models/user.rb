class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy
  # <User id: 1, 
  # created_at: "2022-01-29 04:20:69", 
  # updated_at: "2022-01-30 04:20:69", 
  # email: "firstname.lastname@email.com", 
  # encrypted_password: "$n$o$t$a$p$a$s$s$w$o$r$d", 
  # confirmation_token: nil, 
  # remember_token: "Th15i5An0Bv10U5LyfAkEt0K3N", 
  # username: "firstname_lastname">]> 

end
