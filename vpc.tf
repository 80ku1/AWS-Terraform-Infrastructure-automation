resource "aws_vpc" "myVPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "Dev-VPC" }
}

resource "aws_subnet" "devSubnet" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags                    = { Name = "publicDev" }
}

resource "aws_internet_gateway" "devgateway" {
  vpc_id = aws_vpc.myVPC.id
  tags   = { Name = "devIGW" }
}

resource "aws_route_table" "devIRT" {
  vpc_id = aws_vpc.myVPC.id
  tags   = { Name = "devIRT" }
}

resource "aws_route" "myRoute" {
  route_table_id         = aws_route_table.devIRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devgateway.id
}

resource "aws_route_table_association" "myRouteAssociation" {
  route_table_id = aws_route_table.devIRT.id
  subnet_id      = aws_subnet.devSubnet.id
}