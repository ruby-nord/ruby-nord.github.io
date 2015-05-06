require 'slim'

activate :autoprefixer, browsers: ['last 2 versions', 'ie 8', 'ie 9']

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = :master
end

activate :directory_indexes
activate :livereload

set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read(File.join(root, '.bowerrc')))
  sprockets.append_path File.join(root, @bower_config["directory"])
end

# Build-specific configuration
configure :build do
  activate :asset_hash

  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source')
    f.output_dir    = File.join(root, 'build')
    f.icons = {
      "favicon_base.png" => [
        { icon: "apple-touch-icon-152x152-precomposed.png" },
        { icon: "apple-touch-icon-144x144-precomposed.png" },
        { icon: "apple-touch-icon-120x120-precomposed.png" },
        { icon: "apple-touch-icon-114x114-precomposed.png" },
        { icon: "apple-touch-icon-76x76-precomposed.png" },
        { icon: "apple-touch-icon-72x72-precomposed.png" },
        { icon: "apple-touch-icon-60x60-precomposed.png" },
        { icon: "apple-touch-icon-57x57-precomposed.png" },
        { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
        { icon: "apple-touch-icon.png", size: "57x57" },
        { icon: "favicon-196x196.png" },
        { icon: "favicon-160x160.png" },
        { icon: "favicon-96x96.png" },
        { icon: "favicon-32x32.png" },
        { icon: "favicon-16x16.png" },
        { icon: "favicon.png", size: "16x16" },
        { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
      ]
    }
  end

  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :gzip

  activate :robots,
    rules:    [{ user_agent: '*', allow: %w(/) }],
    sitemap:  "#{data.settings.site.url}/sitemap.xml"

  activate :sitemap, hostname: data.settings.site.url
end
