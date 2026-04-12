output "instance_public_ip" {
  value = aws_instance.Dev.public_ip
}

output "vpc_id" {
  value = aws_vpc.myVPC.id
}

output "keypair_name" {
  value = aws_key_pair.myKeypair.key_name
}
