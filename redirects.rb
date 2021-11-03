# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Versions 1.11 and later: if no dir prefix is provided, use 'main'
r301 %r{/scdf/1-12/(?!main|pro-features)(.*)}, "/scdf/1-11/main/$1"
r301 %r{/scdf/1-11/(?!main|pro-features)(.*)}, "/scdf/1-11/main/$1"

# Versions 1.10 and earlier: remove 'main' prefix if provided
r301 %r{/scdf/(1-[0-9]|10)/main/(.*)}, "/scdf/$1/$2"

# If no version prefix is provided, redirect to docs for latest version
r301 %r{/scdf/(?![\d-]+)(.*)}, "/scdf/1-12/$1"
