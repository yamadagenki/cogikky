class Category < ActiveYaml::Base
  set_root_path Rails.root.join('db/master')
  set_filename 'categories'
end
