output "vpc_ids" {
  value = aws_vpc.vpc.id
}
output "subnet_ids" {
  value = aws_subnet.public.id
}

output "ec2-sg-id" {
  value = aws_security_group.ec2-sg.id
}