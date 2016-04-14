class Fbuser < ActiveRecord::Base
  belongs_to :user
  
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |fbuser|
      fbuser.provider = auth.provider
      fbuser.uid = auth.uid
      fbuser.name = auth.info.name
      fbuser.oauth_token = auth.credentials.token
      fbuser.oauth_expires_at = Time.at(auth.credentials.expires_at)
      fbuser.save
    end
  end
end
