chef-nullmailer
===============


Description
-----------

This (small) cookbook is design to install and configure [Nullmailer](http://untroubled.org/nullmailer/). Nullmailer is like ssmtp a tiny mail transfer agent (MTA). But in contrast to other ones with local queue. Therefore it is significant less likely to lost mails due to (temporally) errors.

The cookbook relies on the distribution package manager to install Nullmailer. Nullmailer is available via all common package manager. But it might be in an older version and therefore missing some features (e.g. tls support added in 1.10).


Requirements
------------

The cookbook requires:

* **ruby 1.9.3+/2.0.0**: Ruby 1.8.7 is currently not supported, but it might work with smaller changes (like hash syntax changes).
* **chef 10+**: The cookbook is design to run under chef 10 and chef 11. Therefore I recommends chef 10.18+ because it is a preparing and migration release. Chef server and chef solo are supported.
* (**Ubuntu**): The cookbook is tested on Ubuntu 12.04. Other distributions like Debian should work also. I appreciate feedback about status and errors on other distributions or versions.


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
