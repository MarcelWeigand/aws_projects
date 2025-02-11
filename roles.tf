# Create an IAM role for Glue
resource "aws_iam_role" "glue_service_role" {
  name = "AWSGlueServiceRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach managed policies for Glue access
resource "aws_iam_policy_attachment" "glue_service_policy" {
  name       = "glue_service_policy_attachment"
  roles      = [aws_iam_role.glue_service_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}