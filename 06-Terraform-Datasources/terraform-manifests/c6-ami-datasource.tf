# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux" { #data means this a data resource and aws_ami means it is a data source we can call
  most_recent = true        #oka dr ki oka ds vuntadi, adhi ea kind of argu ni read cheyyyalo chuskuntadi
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

#the whole code block is called data bloack
#migataha vatiki lagane depends_on mtea.arg kuda e data.res ki support chestai
#alagey mult.provider kuda dhiniki support chestadi
#lifecycle support cheydhu
#count and foreach support chestai
