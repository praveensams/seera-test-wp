resource "aws_instance" "wordpress" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # sg
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # Key pair
  key_name = "wordpress-key"

  provisioner "remote-exec" {
    inline = [
      "sudo yum install epel-release  ansible -y",
      "ansible-pull -U https://github.com/praveensams/wordpress-ansible.git wordpress.yml -e hostnames=${aws_db_instance.default.endpoint}",
    ]
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host = "${aws_instance.wordpress.public_ip}"
    private_key = "${file("~/id_rsa")}"
  }
  
   
}
