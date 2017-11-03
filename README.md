# README

### Setup
* Open .bash_profile
* Create([reference](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)) and insert the following in the file
  ``` Shell
  # Set Github API TOKEN
  export GITHUB_API_TOKEN='YOUR_GITHUB_ACCESS_TOKEN';
  ```
* reload .bash_profile `. ~/.bash_profile`

### Installation
* Clone this repo
* `$ rm -rf .git`
* `$ git init`
* `$ bundle install`
* `$ rails g rename:app_to [YOUR_APP_NAME]`
* Create an .env file for all development environment variables.
* Go to `database.yml` and change your database names
* `$ rake db:create`
* `$ rake db:migrate`
* `$ rails generate active_admin:install`
* `$ rake db:migrate`
* `$ rails generate material_active_admin:install`
* `$ rake db:seed`
* `$ git add -A`
* `$ git commit -m 'Initial Setup'`
* `$ bundle install --gemfile=.overcommit_gems.rb`
* `$ chmod +x bin/setup_overcommit`
* `$ overcommit --install`

### CSS Guides
* Framework - Bootstrap V3
* Custom CSS - Use BEM Convention. See [BEM Documentation](http://getbem.com/naming/)

### Backend Admin Panel
* [ActiveAdmin](https://activeadmin.info/) - ActiveAdmin Documentation
* [CbBackendTheme](https://github.com/cleverbanana/cl0000-cb06-cb-backend-theme) - Clever Banana Studios: ActiveAdmin Theme
