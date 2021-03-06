#
# Run one of the service type definitions.
#


begin
  include_recipe "forever-service::upstart"
rescue Chef::Exceptions::RecipeNotFound
  Chef::Log.error "Allowed values for forever-service/service-type are: 'initd', 'upstart'"
end

# Make sure that the declared service user exists.
#
# Note that the service launches as root: it is the responsibility of the
# service to switch to using the declared user. We just need to know here so
# that we can set up the log directory.
user node['forever-service']['user']

# Set up log directory.
logdir = File.dirname(node['forever-service']['log-file-path'])
directory logdir do
  action :create
  owner node['forever-service']['user']
  group node['forever-service']['user']
  mode 00775
  recursive true
  not_if { ::File.exists?(logdir) }
end

# Run one of the recipes depending on service type.
begin
  include_recipe "forever-service::upstart"
rescue Chef::Exceptions::RecipeNotFound
  Chef::Log.error "Allowed values for forever-service/service-type are: 'initd', 'upstart'"
end
