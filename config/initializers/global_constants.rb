SITE_NAME = "ShogiHub"
if Rails.env == "production"
  ROOT_PATH = "http://shogihub.com"
else
  ROOT_PATH = "http://27.120.94.96:3000"
end
