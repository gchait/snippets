resource "aws_iam_role" "test" {
  name               = var.function_name
  assume_role_policy = data.aws_iam_policy_document.lambda.json
}

resource "aws_lambda_function" "test" {
  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
  role             = aws_iam_role.test.arn

  function_name = var.function_name
  runtime       = var.runtime
  architectures = [var.arch]
  handler       = var.handler
}

resource "aws_lambda_function_url" "test" {
  count              = var.enable_url ? 1 : 0
  function_name      = aws_lambda_function.test.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_permission" "test_url" {
  count                  = var.enable_url ? 1 : 0
  function_name          = aws_lambda_function.test.function_name
  statement_id           = "FunctionURLAllowPublicAccess"
  action                 = "lambda:InvokeFunctionUrl"
  principal              = "*"
  function_url_auth_type = "NONE"
}

resource "aws_lambda_permission" "test_url_invoke" {
  count                    = var.enable_url ? 1 : 0
  function_name            = aws_lambda_function.test.function_name
  statement_id             = "FunctionURLInvokeAllowPublicAccess"
  action                   = "lambda:InvokeFunction"
  principal                = "*"
  invoked_via_function_url = true
}
