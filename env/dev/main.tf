#create VPC
resource "aws_vpc" "nodejs_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
       Name = "nodejsproject_vpc"
    }
}


#create public_subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.nodejs_vpc.id
    cidr_block = "10.0.1.0/24"
	availability_zone = "us-west-2a"
}



#create private_subnet
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.nodejs_vpc.id
    cidr_block = "10.0.2.0/24"
	availability_zone = "us-west-2b"
}


#create Internet_Gateway
resource "aws_internet_gateway" "nodejs_igw" {
     vpc_id = aws_vpc.nodejs_vpc.id 
}

#Route_Table

resource "aws_route_table" "PublicRT" {
    vpc_id =  aws_vpc.nodejs_vpc.id
    route {
	 cidr_block = "0.0.0.0/0"
         gateway_id = aws_internet_gateway.nodejs_igw.id
    }
}


#Route_Table_association
resource "aws_route_table_association" "PublicRTA" {
     subnet_id = aws_subnet.public_subnet.id
     route_table_id = aws_route_table.PublicRT.id
     }

#S3 Bucket
resource "aws_s3_bucket" "k9testbucket" {
    bucket = "k9bucketforterraformk9"
}






