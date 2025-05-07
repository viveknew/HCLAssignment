# HCLAssignment

Below are the ursl to access two microservices running on the EKS CLUSTER

http://aef73d3560ff04edaa7faa1b3b387abf-277513274.us-west-2.elb.amazonaws.com:3001/appointments
http://a13330acbd44648e98e8da7b9bfdc0de-1734846358.us-west-2.elb.amazonaws.com:3000/health

The terraform.tfstate file is stored in the S3 storage.
DynamoDB is used for state locking.
