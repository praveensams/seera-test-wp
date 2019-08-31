resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "wordpress"
  password             = "wpassword"
  parameter_group_name = "default.mysql5.7"
	db_subnet_group_name  = "${aws_db_subnet_group.default.id}"
}


resource "aws_db_subnet_group" "default" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = ["${aws_subnet.main-public-1.id}","${aws_subnet.main-public-2.id}","${aws_subnet.main-public-3.id}"]
}
