# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.pure-energy.org"
SitemapGenerator::Sitemap.create do
  add biomass_path, :priority => 0.7, :changefreq => 'daily'
  add wind_path, :priority => 0.7, :changefreq => 'daily'
  add solar_path, :priority => 0.7, :changefreq => 'daily'
  add geothermal_path, :priority => 0.7, :changefreq => 'daily'
  add wind_path, :priority => 0.7, :changefreq => 'daily'
  add home_path, :priority => 0.7, :changefreq => 'daily'
  add biofuel_path, :priority => 0.7, :changefreq => 'daily'
  add sources_path, :priority => 0.7, :changefreq => 'daily'
  add compare_path, :priority => 0.7, :changefreq => 'daily'
  add results_path, :priority => 0.7, :changefreq => 'daily'
end
