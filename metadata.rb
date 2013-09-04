name              'nullmailer'
maintainer        'Malte Swart'
maintainer_email  'chef@malteswart.de'
license           'Apache 2.0'
description       'Installation and configuration of nullmailer'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.1'

%w{ ubuntu }.each do |os|
  supports os
end
