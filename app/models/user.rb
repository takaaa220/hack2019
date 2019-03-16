class User < ApplicationRecord
  has_many :shops, dependent: :destroy

  def self.create_or_find_with_twitter(auth)
    user = User.find_by(uid: auth.uid)

    if user.nil?
      user = User.create(
        uid: auth.uid,
        name: auth.info.name,
        username: auth.info.nickname
      )
    end

    user
  end

  def res_model
    {
      uid: self.uid,
      name: self.name,
      username: self.username
    }
  end

end
