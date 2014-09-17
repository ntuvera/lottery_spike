base_url = ENV['DATABASE_URL'] || 'postgres://localhost/wdi_bloop_app'
ActiveRecord::Base.establish_connection(database_url)
