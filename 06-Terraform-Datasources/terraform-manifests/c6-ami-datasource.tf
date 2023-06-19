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

#ec2 ds
data "aws_ec2_instance_type_offering" "example" {
  filter {
    name   = "instance-type"
    values = ["t3.medium", "t3.micro"]
  }

  preferred_instance_types = toset(["t3.medium", "t2.micro"])
}
#the whole code block is called data bloack
#migataha vatiki lagane depends_on mtea.arg kuda e data.res ki support chestai
#alagey mult.provider kuda dhiniki support chestadi
#lifecycle support cheydhu
#count and foreach support chestai
#if u want to call api/cloud from outside terraform at that time also s will be useful
#eadaina another diff pro lo vuunna data ni present tf project lo use cheyyali anna sare
#e ds use avutai
#u can also use to fetch or computed values in tf config using ds
#it declares with a data resource resource name
#data resource velli data source ni call chestadi dhinni data block antam
#each dr associated with single ds
#we can refer these ds into other files also like ec2-instance.tf