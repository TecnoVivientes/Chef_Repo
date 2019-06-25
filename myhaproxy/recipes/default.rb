#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

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

include_recipe 'haproxy::manual'
