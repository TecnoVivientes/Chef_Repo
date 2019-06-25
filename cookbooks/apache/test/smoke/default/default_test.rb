# Inspec test for recipe apache::default

unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe command('curl localhost') do
  its('stdout') { should match('Hello, world') }
end