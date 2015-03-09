Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id     = ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
    aws.instance_type = "t2.micro"
    aws.region = "ap-northeast-1"
    aws.ami = "ami-20b6aa21" # ubuntu 14.04
	aws.security_groups = ENV['AWS_SECURITY_GROUPS'].split(',')

    override.ssh.username = ENV['AWS_SSH_USERNAME']
    override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY_PATH']
  end
end
