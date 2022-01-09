class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :comments

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end
