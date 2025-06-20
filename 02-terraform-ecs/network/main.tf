resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = true

    tags = {Name = "pb-subnet"}
}

resource "aws_internet_gateway" "gw" {
    
   vpc_id = aws_vpc.vpc.id
   tags = {Name="gw"}
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "rt_association" {
    subnet_id = aws_subnet.public.id 
    route_table_id = aws_route_table.rt.id 
}

resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

