yum install git
yum install zsh
yum install wget
yum install vim

yum --enablerepo=extras install epel-release
yum install python-pip

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
yum install docker
ln -s /usr/libexec/docker/docker-proxy-current /usr/bin/docker-proxy

sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
chmod 777 /var/run/docker.sock

docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
   
cd /opt
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
tar xzf jdk-8u201-linux-x64.tar.gz
alternatives --install /usr/bin/java java /opt/jdk1.8.0_201/bin/java 1
alternatives --config java
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_201/bin/jar 1
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_201/bin/javac 1
alternatives --set jar /opt/jdk1.8.0_201/bin/jar
alternatives --set javac /opt/jdk1.8.0_201/bin/javac

wget ftp.unicamp.br/pub/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar xzf apache-maven-3.6.0-bin.tar.gz
alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.6.0/bin/mvn 1

sudo cp /app/maven/settings-linux.xml /opt/apache-maven-3.6.0/conf/settings.xml --remove-destination
sudo cp /app/maven/settings-security.xml /opt/apache-maven-3.6.0/conf/ --remove-destination

