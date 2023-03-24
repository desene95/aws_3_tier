module "Networking" {
    source      =   "../Networking"
    vpc_cidr    =   var.vpc_cidr
    websubnet   =   var.websubnet
    dbsubnet-1    =   var.dbsubnet-1
    dbsubnet-2    =   var.dbsubnet-2
    appsubnet   =   var.appsubnet


  
}
resource "aws_instance" "webinstance" {
  ami                         = "ami-0e9d8c96b045dbc75"
  instance_type               = "t2.micro"
  #count                       = 1
  key_name                    = var.key_pair
  vpc_security_group_ids      = [module.Networking.demosg]
  subnet_id                   = module.Networking.websubnet
  associate_public_ip_address = true
  #user_data                   = "${file("data.sh")}"
  #multi_az                     = true
tags = {
    Name = "Web Instance"
  }
}

resource "aws_instance" "appinstance" {
  ami                         = "ami-0e9d8c96b045dbc75"
  instance_type               = "t2.micro"
  #count                       = 1
  key_name                    = var.key_pair
  vpc_security_group_ids      = [module.Networking.demosg]
  subnet_id                   = module.Networking.appsubnet
  associate_public_ip_address = true
  #user_data                   = "${file("data.sh")}"
  #multi_az                     = true
tags = {
    Name = "App Instance"
  }
}