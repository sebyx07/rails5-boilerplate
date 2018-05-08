desc 'Stop all docker processes'
task :stop do
  sh 'docker stop $(docker ps -a -q)'
end


desc 'Install docker'
task :setup_env do
  sh <<-SH
    sudo apt-get update
    sudo apt-get install git postgresql-client -y
    
    sudo apt-get install \
        linux-image-extra-$(uname -r) \
        linux-image-extra-virtual
    
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt-get update
    sudo apt-get install docker-ce
    
    sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo adduser $USER docker
  SH

  p 'Now restart your computer, then start docker'
end
