resource "aws_key_pair" "myKeypair" {
  key_name   = "devKey"
  public_key = file("~/.ssh/devKey.pub")
}

resource "aws_instance" "Dev" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.myAMI.id
  key_name               = aws_key_pair.myKeypair.key_name
  vpc_security_group_ids = [aws_security_group.mySecurityGroup.id]
  subnet_id              = aws_subnet.devSubnet.id
  user_data              = file("userdata.tpl")

  tags = { Name = "DevNode" }
}