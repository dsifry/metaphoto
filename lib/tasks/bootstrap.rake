namespace :bootstrap do

  desc "Create the default Roles"
  task :default_roles => :environment do
    Role.create( :name => 'Admin', :description => 'Administrators' )
    Role.create( :name => 'User', :description => 'Regular Users' )
    Role.create( :name => 'Guest', :description => 'Guests (limited access)' )
  end

  desc "Add the default user"
  task :default_user => :environment do
    User.create( :name => 'admin', :email => 'admin@splendoo.com', :password => 'admin' )
    User.create( :name => 'default', :email => 'nobody@splendoo.com', :password => 'password' )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :default_roles]
end