#
# Cookbook Name:: trema
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{ruby ruby-dev rubygems git libpcap-dev libsqlite3-dev}.each do |package_name|
	package package_name
end

gem_package "trema"

