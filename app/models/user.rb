class User < ActiveRecord::Base


  has_one :person
  
  def image_large
    self.image.gsub("type=square", "type=large")
  end

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      # right now only need to support FB
      user.image = auth["info"]["image"]
      user.location = auth["info"]["location"]
      user.email = auth["info"]["email"] || auth["extra"]["user_hash"]["email"]
    end
  end
end
