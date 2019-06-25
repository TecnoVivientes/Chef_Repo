#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

all_web_nodes = search('node','role:web_server')
members_pool = []
all_web_nodes.each do |web_node|
  webserver = {
    'hostname' => web_node['cloud']['local_hostname'],
    'ipaddress' => web_node['cloud']['public_ipv4'],
    'port' => 80,
    'ssl_port' => 80
  }
  members_pool.push(webserver)
end
 
node.default['haproxy']['members'] = members_pool
include_recipe 'haproxy::manual'


=begin
node.default['haproxy']['members'] = [
	{
	  'hostname' => 'ip-172-30-3-22.ec2.internal',
	  'ipaddress' => '52.23.239.54',
	  'port' => 80,
	  'ssl_port' => 80
	},
	{
		'hostname' => 'WIN-NJ5OO7IAJNR.ec2.internal',
		'ipaddress' => '3.88.58.251',
		'port' => 80,
		'ssl_port' => 80
	}
]
=end