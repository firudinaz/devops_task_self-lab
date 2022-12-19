resource "aws_ecr_repository" "flask-repository" {
  name                 = "flask-repo"
  image_tag_mutability = "IMMUTABLE"
}




data "aws_availability_zones" "available" {}


resource "aws_ecr_repository_policy" "flask-repo-policy" {
  repository = aws_ecr_repository.flask-repository.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
