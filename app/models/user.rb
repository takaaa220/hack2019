class User < ApplicationRecord
  has_many :shops, dependent: :destroy
  validates :name, presence: true
  validates :username, presence: true
  validates :uid, presence: true

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
