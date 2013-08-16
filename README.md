chef-nullmailer
===============

[![Build Status](https://travis-ci.org/mswart/chef-nullmailer.png)](https://travis-ci.org/mswart/chef-nullmailer)


Description
-----------

This (small) cookbook is designed to install and configure [Nullmailer](http://untroubled.org/nullmailer/). Nullmailer is like ssmtp a tiny mail transfer agent (MTA). But in contrast to other ones with a local mail queue. Therefore it is significant less likely to lose mails due to (temporally) errors.

The cookbook relies on the distribution package manager to install Nullmailer. Nullmailer is available via all common package managers. But it might be in an older version and therefore missing some features (e.g. TLS support added in [1.10](http://untroubled.org/nullmailer/NEWS)).


Requirements
------------

The cookbook requires:

* **ruby 1.9.3+/2.0.0**: Ruby 1.8.7 is currently not supported, but it might work with smaller changes (like hash syntax changes).
* **chef 10+**: The cookbook is design to run under chef 10 and chef 11. Therefore I recommends chef 10.18+ because it is a preparing and migration release. Chef server and chef solo are supported.
* (**Ubuntu**): The cookbook is tested on Ubuntu 12.04. Other distributions like Debian should work also. I appreciate feedback about status and errors on other distributions or versions.


Usage
-----

The cookbook has only one recipe `default` installing and configuring Nullmailer. So add to your `run_list` `recipe[nullmailer]`. See to following section for possible attributes to influence the Nullmailer configuration and the cookbook behavior. But in most cases no changes are needed.

The cookbooks uses the only attributes under ``node['nullmailer']``.

### Relay host

* `relayhost` (`"mail.#{node['domain']}"`): Remote server to which to send each message
* `relay_proto` (`'smtp'`): Default protocol used to transfer mails the to remote servers.
* `relay_options`: A dictionary with additional options for the protocol executable. Run `/usr/lib/nullable/$protocol' --help` for argument documentation. Keys are parameter names. Use boolean values to enable/disable flag attributes for string values for arguments with parameter.

### Main Options

* `mailname` (`node['fqdn']`): the mail name (file ``/etc/mailname``). Used as default for identifier for the node for all mail aspects.
* `adminaddr` (`nil`): If this is set to a non-empty value, all mails to local recipients (localhost or mailname as domain part) are sent instead to this mail address.
* `defaulthost` (`nil` means `mailname` or `'defaulhost'`): The hostname added to any address missing a host part. `nil` means not create the file - Nullmailer fails back to use the `mailname` file or the string `defaulthost`.
* `defaultdomain` (`nil` means `mailname`): This string is append to all hostnames without a period except `'localhost'`, including `defaulthost` and `idhost`.

### Expert Options

* `idhost` (`nil` means `defaulhost`): This host name is used for generated message ids. `nil` means not create this file -- Nullmailer uses the canonical version of the `defaulthost` option.
* `pausetime` (`nil` means Nullmailer default): The number of seconds to pause between successive queue runs when there are messages in the queue.
* `sendtimeout` (`nil` means Nullmailer default): The number of seconds to wait for a remote module listed above to complete sending a message before killing it and trying again.
* `helohost` (`nil` means `me`): The hostname uses for `helo` in smtp sessions.

### Extended Usage

The cookbook is configurable via node attributes. If you need to change the cookbook sources to uses in your way, this is a bug or missing feature. In both, please report this and it will be fixed.

If you want to manage a Nullmailer configuration file by in other way and your are restricted by the configuration resources of this cookbook, you can instruct the cookbook to not do certain tasks by setting options under `node['nullmailer']['configure']`:

* `mailname`: whether manage `/etc/mailname` with this cookbook.
* `remotes`: configure `remotes` file

Contributing
------------

The cookbook is developed on [github](https://github.com). To report bugs [create an issue](https://github.com/mswart/chef-nullmailer/issues) or open a pull request if you know what needs to be changed.

Feel free to contact me (<chef@malteswart.de> or mswart on freenode) if you have detailed questions about the cookbook. I am interested in your opinion, wishes and use cases.


License and Author
------------------

Author:: Malte Swart (<chef@malteswart.de>)
Copyright:: 2013, Malte Swart

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
