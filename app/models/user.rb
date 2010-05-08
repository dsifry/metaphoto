class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :activities
  has_many :photos

  acts_as_authentic
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def self.for(facebook_id, facebook_session=nil)
    returning find_or_create_by_facebook_id(facebook_id) do |user|
      unless facebook_session.nil?
        user.store_session(facebook_session.session_key)
      end
    end
  end


  def store_session(session_key)
    if self.session_key != session_key
      update_attribute(:session_key, session_key)
    end
  end

  def facebook_session
    @facebook_session ||=
            returning Facebooker::Session.create do |session|
              session.secure_with!(session_key, facebook_id, 1.day.from_now)
            end
  end
  
end
