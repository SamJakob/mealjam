JsRoutes.setup do |config|
  config.module_type = 'ESM'

  # remove _path suffix in path routes
  config.compact = true

  # exclude rails auto-generated routes
  config.exclude = [/rails_/]
end
