plugins=(
  api
  autocomplete
  buildpack-registry
  heroku-audit-trail
  heroku-enterprise
  heroku-pg
  heroku-slugs
  semver
)

echo "installing heroku plugins..."
heroku plugins:install ${plugins[@]}
