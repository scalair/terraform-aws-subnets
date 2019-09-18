# private subnets
resource "aws_subnet" "private" {
  count = length(var.aws_subnet_cidr_private)

  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = var.aws_subnet_cidr_private[count.index]
  availability_zone = var.aws_subnet_availability_zone[count.index]

  tags = "${merge(
    var.aws_subnet_tags,
    var.aws_subnet_private_tags,
    map(
      "Name", "${var.aws_subnet_prefix}-private-${var.aws_subnet_availability_zone[count.index]}"
    )
  )}"
}

resource "aws_route_table_association" "private" {
  count = length(var.aws_subnet_cidr_private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = data.terraform_remote_state.vpc.outputs.private_route_table_ids[count.index]
}

# public subnets
resource "aws_subnet" "public" {
  count = length(var.aws_subnet_cidr_public)

  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = var.aws_subnet_cidr_public[count.index]
  availability_zone = var.aws_subnet_availability_zone[count.index]

  tags = "${merge(
    var.aws_subnet_tags,
    var.aws_subnet_public_tags,
    map(
      "Name", "${var.aws_subnet_prefix}-public-${var.aws_subnet_availability_zone[count.index]}"
    )
  )}"
}

resource "aws_route_table_association" "public" {
  count = length(var.aws_subnet_cidr_public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = data.terraform_remote_state.vpc.outputs.public_route_table_ids[0]
}