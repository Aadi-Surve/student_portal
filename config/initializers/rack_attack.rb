# Configure Rack::Attack
class Rack::Attack
  # Allow all local traffic
  safelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Limit requests to 300 per 5 minutes per IP for API endpoints
  throttle('api/ip', limit: 300, period: 5.minutes) do |req|
    if req.path.start_with?('/api')
      req.ip
    end
  end

  # Limit failed login attempts for Devise
  throttle('login/email', limit: 5, period: 20.minutes) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.params['email'].to_s.downcase.gsub(/\s+/, '')
    end
  end
end