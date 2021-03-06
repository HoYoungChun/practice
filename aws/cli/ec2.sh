# various ec2 script example

# launch ec2 instances (amazon linux)
# Amazon linux ap-northeast-1 : ami-383c1956
LINUX_AMI=ami-383c1956
KEYPAIR=MyKey
aws ec2 run-instances --image-id $LINUX_AMI --count 1 --instance-type t2.micro --key-name $KEYPAIR \
--security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx


# find instance by tag name
aws ec2 describe-instances --filter 'Name=tag:Name,Values=watple' --query Reservations[0].Instances[0].InstanceId


# create snapshot for every 6 hour
echo "* */6 * * * aws ec2 create-snapshot --volume-id <volume-id> 2>&1 >> /tmp/cronlog" > cronjob
crontab cronjob

# cron reset
crontab -r

# generate log file name
echo "I am some file" > "hoyoung-$(date +'%m-%d-%Y-%H:%M:%S').log"


# install cloud-trail
sudo yum install -y awslogs

:'
Edit the /etc/awslogs/awscli.conf file and in the [default] section
region = ap-northeast-1
aws_access_key_id = <YOUR ACCESS KEY>
aws_secret_access_key = <YOUR SECRET KEY>
'

# aws ec2 create name tag
NAME="temp-new"
aws ec2 create-tags --resources i-da4094f6
--tags "Key=Name,Value=$NAME"
