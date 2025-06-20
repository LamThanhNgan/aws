


resource "aws_ecr_repository" "this" {
  name                 = "gla-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_iam_role" "this" {
  name = "ecsExecutionRole-01"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_ecs_cluster" "cluster" {
  name = "gla-cluster"
}


resource "aws_ecs_task_definition" "this" {
  
  depends_on               = [aws_iam_role.this]
  family                   = "family-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.this.arn


  container_definitions = jsonencode([{
    name      = "web-nodejs-container"
    image     = "${aws_ecr_repository.this.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 8000
      hostPort      = 8000
      protocol      = "tcp"
    }]
    
  }])
}




resource "aws_ecs_service" "this" {
  depends_on      = [aws_ecs_task_definition.this]
  name            = "service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.subnet_ids]
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }
}

