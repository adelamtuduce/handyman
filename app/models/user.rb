class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)    
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        auth.provider = “Facebook”
        user = User.create!(first_name:auth.extra.raw_info.first_name,
        last_name:auth.extra.raw_info.last_name,
        provider:auth.provider,
        email:auth.info.email,
        password:Devise.friendly_token[0,20],
        confirmed_at:Time.zone.now # if u don’t want to send any confirmation mail
        )
      end
    end
  end
    
  def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        access_token.provider = “Google”
        user = User.create(first_name: data[“first_name”],
        last_name: data[“last_name”],
        provider:access_token.provider,
        email: data[“email”],
        password: Devise.friendly_token[0,20],
        confirmed_at:Time.zone.now # if u don’t want to send any confirmation mail
        )
      end
    end 
  end
end
