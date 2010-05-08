authorization do
  role :admin do
    has_permission_on [:activities, :photo, :role, :user, :user_session, :venue_type], :to => :everything
    has_permission_on [:activities] , :to => [:homepage]
  end
  role :user do
    has_permission_on [:activities, :email, :photo] do
      to :manage
      if_attribute :id => is {user.id}
    end
    has_permission_on [:activities], :to => [:homepage]
  end
  role :guest do
    has_permission_on [:user, :user_session], :to => [:new, :create, :login]
    has_permission_on [:activities], :to => [:homepage]
  end
end

privileges do
  privilege :manage do
    includes :new, :create, :show, :update, :destroy
  end
  privilege :view do
    includes :index, :show
  end
  privilege :everything do
    includes :index, :show, :new, :create, :edit, :update, :destroy
  end
end
