# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "pratik2457"
client_key               "#{current_dir}/pratik2457.pem"
chef_server_url          "https://api.chef.io/organizations/learningchef2457"
cookbook_path            ["#{current_dir}/../cookbooks"]
