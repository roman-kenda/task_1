class TwitterAccount < ActiveRecord::Base
  belongs_to :user

  validates :uid, uniqueness: true #{ true, message: "You have connecting, yet." }
#  def from_omniauth(auth)
#    User.where(provider: auth["provider"], uid: auth["uid"]) || create_from_omniauth(auth)
#  end

#  def create_from_omniauth(auth)
#    self.provider = auth["provider"]
#    self.uid = 23 #auth["uid"]
#    self.token = auth["credentials"]["token"]
#    self.secret = auth["credentials"]["secret"]
#    self.first_name ||= auth["name"].split(' ')[1]
#    self.last_name ||= auth["name"].split(' ')[0]
#  end
end
