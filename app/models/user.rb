class User < ApplicationRecord
  has_many :shops, dependent: :destroy
end
