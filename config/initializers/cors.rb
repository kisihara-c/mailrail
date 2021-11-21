Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ENV['ORIGINS_DOMAIN']
  
      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['Per-Page', 'Total', 'Link']
    end
  end