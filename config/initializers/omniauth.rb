Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['4591025'], ENV['NI9VKFPFEzkpF8dsBD0z']
end