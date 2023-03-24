# resource "aws_subnet" "dbsubnet-1" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "${var.dbsubnet-1}"
#   availability_zone = "ca-central-1a"

#   tags = {
#     Name = "dbsubnet"
#   }
# }

# resource "aws_subnet" "dbsubnet-2" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "${var.dbsubnet-2}"
#   availability_zone = "ca-central-1b"

#   tags = {
#     Name = "dbsubnet"
#   }
# }

# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [aws_subnet.dbsubnet-1.id, aws_subnet.dbsubnet-2.id]
# tags = {
#     Name = "My DB subnet group"
#   }
# }

# resource "aws_db_instance" "default" {
#   allocated_storage      = 10
#   db_subnet_group_name   = aws_db_subnet_group.default.id
#   engine                 = "mysql"
#   engine_version         = "8.0.20"
#   instance_class         = "db.t2.micro"
#   multi_az               = true
#   name                   = "mydb"
#   username               = "username"
#   password               = "password"
#   skip_final_snapshot    = true
#   vpc_security_group_ids = [aws_security_group.database-sg.id]
# }