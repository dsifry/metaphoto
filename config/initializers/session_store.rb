# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_metaphoto_session',
  :secret      => 'd8c62f8fe42312d71c424f891d2f8860ad389c6d93ade239e1a2dc2584d924b93f0a8ea524174571842c9a156c268c4d42665e707d5432432d48654275416754'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
