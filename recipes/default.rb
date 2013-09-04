#
# Cookbook Name:: nullmailer
# Recipe:: default
#
# Author:: Malte Swart (<chef@malteswart.de>)
#
# Copyright 2013, Malte Swart
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install packages
package 'nullmailer'

# setup service - queue handling
service 'nullmailer' do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end

# configure:
file '/etc/mailname' do
  content node['nullmailer']['mailname']
  user 'root'
  group 0
  mode 00644
  action :create
  only_if { node['nullmailer']['configure']['mailname'] }
end

%w{adminaddr idhost defaulthost helohost defaultdomain pausetime sendtimeout}.each do |control_file|
  file "/etc/nullmailer/#{control_file}" do
    content node['nullmailer'][control_file].to_s
    user 'root'
    group 0
    mode 00644
    action :create
    not_if { node['nullmailer'][control_file].nil? }
  end
end

remote = "#{node['nullmailer']['relayhost']} #{node['nullmailer']['relay_proto']}"

file '/etc/nullmailer/remotes' do
  content(node['nullmailer']['relay_options'].inject(remote) do |options, (option, value)|
    options += " --#{option}" if value
    options += "=#{value}" if value.is_a?(String) or value.is_a?(Fixnum)
    options
  end)
  user 'mail'
  group 'mail'
  mode 00600
  action :create
  only_if { node['nullmailer']['configure']['remotes'] }
end
