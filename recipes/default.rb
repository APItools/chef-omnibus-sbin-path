#
# Cookbook Name:: unzip
# Recipe:: default
#
# Copyright 2014, Michal Cichra
#
# MIT License

#
# We fully control the $PATH for the omnibus build user.
#
build_user_home = node['omnibus']['build_user_home']

file File.join(build_user_home, '.bashrc.d', 'sbin-path.sh') do
  owner   node['omnibus']['build_user']
  group   node['omnibus']['build_user_group']
  mode    '0755'
  content <<-EOH.gsub(/^ {4}/, '')
    # This file is written by Chef for #{node['fqdn']}.
    # Do NOT modify this file by hand.

    export PATH="$PATH:/sbin"
  EOH
end
