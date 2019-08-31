output "instance_ip" {
   value=[ "${aws_instance.wordpress.public_ip}" ]
	}



output "rds_instance_ip" {
   value=[ "${aws_db_instance.default.endpoint}" ]
	}
