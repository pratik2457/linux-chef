#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "php" do
	action :install
end


cookbook_file "/home/user/pratik.text" do
	source "pratik.text"
	mode "0644"
end

