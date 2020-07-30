Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    {
      scope: 'userinfo.profile, userinfo.email, calendar',
      image_aspect_ratio: 'square', image_size: 48,
      access_type: "offline",
      prompt: "consent",
      name: 'google',
      :provider_ignores_state => true
    }
end
