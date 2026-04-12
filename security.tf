# Fetch current public IP dynamically
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com/"
}

resource "aws_security_group" "mySecurityGroup" {
  name        = "dev_sg"
  description = "security_group_for_dev"
  vpc_id      = aws_vpc.myVPC.id

  tags = {
    Name = "mySecurityGroup"
  }

}
# Allow SSH only from current public IP
resource "aws_vpc_security_group_ingress_rule" "allow_traffic_ipv4_ssh" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "${chomp(data.http.my_ip.response_body)}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

