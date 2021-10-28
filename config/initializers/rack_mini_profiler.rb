if Rails.env.development?
  # Disable the profiler by default.
  Rack::MiniProfiler.config.enabled = false
end