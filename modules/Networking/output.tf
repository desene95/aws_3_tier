output "dbsubnet-1"{
value = aws_subnet.dbsubnet-1.id
}

output "dbsubnet-2"{
value = aws_subnet.dbsubnet-2.id
}

output "appsubnet"{
value = aws_subnet.appsubnet.id
}

output "websubnet"{
value = aws_subnet.websubnet.id
}

output "demosg"{
  value = aws_security_group.demosg.id
}