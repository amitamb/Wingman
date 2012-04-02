Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '284529138288915', '3ec89b446b74d3ce0533e3df6f007256', {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
end
