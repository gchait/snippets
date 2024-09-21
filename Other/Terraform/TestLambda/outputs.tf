output "lambda_url" {
  value = var.enable_url ? aws_lambda_function_url.test[0].function_url : null
}
