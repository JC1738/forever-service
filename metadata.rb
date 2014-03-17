name              'forever-service'
maintainer        'Reason'
maintainer_email  'reason@exratione.com'
license           'MIT'
description       'Set up a service to run a designated Node.js script.'
version           '0.0.3'
recipe            'forever-service', 'Set up a service to run a designated Node.js script.'
recipe            'forever-service::upstart', 'Set up an upstart service definition.'
recipe            'forever-service::initd', 'Set up an init.d service definition.'
recipe            'forever-service::start', 'Start the service.'

%w{ fedora redhat centos amazon scientific oracle ubuntu debian }.each do |os|
  supports os
end

