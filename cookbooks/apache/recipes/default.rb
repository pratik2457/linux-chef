#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

if node["platform"] == "ubuntu"
	execute "apt-get update -y" do
	end
end

package "httpd" do
	package_name node["apache"]["package"]
	action :install
end

node["apache"]["sites"].each do |sitename, data|
#	document_root = "/content/sites/#{sitename}"
	if node["platform"] == "ubuntu"
	document_root = "/var/www/"
	html_root = "/var/www/index.html"
	elsif node["platform"] == "centos"
	document_root = "/var/www/html/"
	html_root = "/var/www/html/index.html"
	end
	
	directory document_root do
		mode "0755"
		recursive true
	end

	if node["platform"] == "centos"
		template_location = "/etc/httpd/conf.d/#{sitename}.conf"
	elsif node["platform"] == "ubuntu"
		template_location = "/etc/apache2/sites-enabled/#{sitename}.conf"
	end

	template template_location do
		source "vhost.erb"
		mode "0644"
		variables(
			:document_root => document_root,
			:port => data["port"],
			:domain => data["domain"]
		)	
		notifies = :restart, "service[httpd]"
	end

	template html_root do
		source "index.html.erb"
		mode "0644"
		variables(
			:sitehead => data["sitehead"],
			:welcome => "yet to finish"
			)
	end
end

execute "rm /etc/httpd/conf.d/welcome.conf"do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[httpd]"
end


service "httpd" do
	service_name node["apache"]["package"] 
	action [:enable, :start]
end

#include_recipe "php::default"
