#
# Cookbook Name:: nullmailer
# Attributes:: default
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

default['nullmailer']['relayhost'] = "mail.#{node['domain']}"
default['nullmailer']['relay_proto'] = 'smtp'
default['nullmailer']['relay_options'] = {}

default['nullmailer']['mailname'] = node['fqdn']

# boolean flags to disable configuration file management
default['nullmailer']['configure']['mailname'] = true
default['nullmailer']['configure']['remotes'] = true
