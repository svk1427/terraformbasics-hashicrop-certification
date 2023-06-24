# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-0b08bfc6ff7069aff" # Amazon Linux
  instance_type     = "t2.micro"
  key_name          = "newkey"
  #availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
  tags = {
    "Name" = "will-destroy-in-us-east-1-and-launch-ec2-in-ap-south-1" #destroy in 1b and recreate in 1a
  }

  lifecycle {
    create_before_destroy = true
  }

}

#this is also a behaviour changes of res meta arg
#lifecycle is a nested block that can appear within a resource block
#3 types of lifecycles are available 

#1.Create_before_destroy - for ex, us-east-1a lo config ni destroy chesi us-east-2b lo create
# cheyyali annappudu edhi use chestey,first edhi 2b lo infra mothham create
#-chesina tarvata 1a lo infra ni destroy chestadi so thats why we called createbeforedestroy.

#2.Prevent_destroy - for ex, eadaina imp config elanti situation lo kuda delete avvakudadhu annappudu
#e preventdestroy use chestam edhi use chestey ea usecase lo aiena 
#-sare mana config delete/destroy avvadhu even though u applied destroy command, kani ah specific res
#ni remove chesi apply chestey matram delete/destroy ipothundi.

#3.Ignore changes - okasari infra create ipoyaka, eadaina mandatary scenario/usecase valla okokkasari 
#manual ga aws console  nundi changes chestam, chesina tarvata
#future lo eppudaina tf apply cmnd esthey manual changes anni delete ipothai so ala delete
# avvakunda ah particular manual changes ni ignore cheydaniki e LC use chestam.
#eavaitey manam manual ga add chesamo ah particular res lo vatini comma sperated
# values lo echi eppudaina migatha infra ni execute chestey evi dellete avvakunda vuntai.
#comma seperated values kakunda all ane option kuda evvochu ela estehy changes anni 
#remove avvakunda vuntai
