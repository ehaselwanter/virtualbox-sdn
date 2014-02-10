#
# Cookbook Name:: trema
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{ruby ruby-dev rubygems git libpcap-dev libsqlite3-dev libglib2.0-dev tmux vim}.each do |package_name|
	package package_name
end

gem_package "trema"

git "/home/vagrant/trema" do                            
    repository "https://github.com/trema/trema.git"
    revision "master"                                   
    action :sync                                     
    user "vagrant"                                    
    group "vagrant"  
end

git "/home/vagrant/trema-apps" do                            
    repository "https://github.com/trema/apps.git"
    revision "master"                                   
    action :sync                                     
    user "vagrant"                                    
    group "vagrant"  
end


