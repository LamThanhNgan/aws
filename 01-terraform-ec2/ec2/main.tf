 resource "aws_instance" "ec2" {
    ami = "ami-0435fcf800fb5418d"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.ec2-sg 

    user_data = <<-EOF
    #!/bin/sh
    yum update -y
    yum install nginx -y 
    systemctl enable nginx 
    systemctl start nginx

    EOF

 }