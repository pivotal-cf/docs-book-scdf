# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# If no dir prefix is provided, use 'main'
r301 %r{/scdf/([0-9]-[0-9]{2})/(?!main|pro-features)(.*)}, "/scdf/$1/main/$2"

# If no version prefix is provided, redirect to docs for latest version
r301 %r{/scdf/(?![\d-]+)(.*)}, "/scdf/1-11/$1"
