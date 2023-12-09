# terraformtest
test create aws resources

Prereq:t
1. Terraform CLI
2. AWS CLI. Run "aws configure" after downloading
3. create alias tf=terraform #gets really annoying to type terraform  after awhile

Steps:
1. Create main.tf
2. code whatever you need in main.tf
3. tf fmt -recursive #formats all tf files in current and its sub folders
4. tf init
5. tf validate #validate tf file (not aws)
6. tf plan #checks what is setup vs what is in tf file. Inform what will be changed
7. tf apply #apply changes
