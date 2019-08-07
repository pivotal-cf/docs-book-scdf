# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/scdf/(?![\d-]+)(.*)}, "/scdf/1-6/$1"
r301 %r{/scdf/1-0/(.*)}, 'https://docs.pivotal.io/archives/scdf-docs-1.0.pdf'
r301 %r{/scdf/1-1/(.*)}, 'https://docs.pivotal.io/archives/scdf-docs-1.1.pdf'
