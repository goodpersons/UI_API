# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors


Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins "example.com"
    origins "http://localhost:5173"

    resource "*",
      headers: :any,
      #传递凭据  如果指定了通配符 (*) 原点，则此选项不能设置为true
      credentials: true,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
