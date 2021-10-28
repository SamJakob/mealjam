# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  if Rails.env.development?
    policy.connect_src *policy.connect_src, "ws://#{ ViteRuby.config.host_with_port }", :self
    policy.script_src *policy.script_src, "http://#{ ViteRuby.config.host_with_port }", :self, :unsafe_eval, :unsafe_inline
  else
    policy.default_src *policy.default_src, :self, :https
    policy.connect_src *policy.connect_src, :self, :https
    policy.script_src *policy.script_src, :self, :https
  end

#   policy.default_src :self, :https
#   policy.font_src    :self, :https, :data
#   policy.img_src     :self, :https, :data
#   policy.object_src  :none
#   policy.script_src  :self, :https
    # Allow @vite/client to hot reload changes in development


    # You may need to enable this in production as well depending on your setup.
#    policy.script_src *policy.script_src, :blob if Rails.env.test?

#   policy.style_src   :self, :https

#   # Specify URI for violation reports
#   # policy.report_uri "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
