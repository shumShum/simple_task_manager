# Allow usage on Vagrant
if (defined? BetterErrors) && (Rails.env == "development")
	BetterErrors::Middleware.allow_ip! "10.0.2.2"
end