# Terraform Presentation Code

Code used for the "IAC with terraform" talk

## Setup 🔨

1. Download and install [Terraform 0.11.5](https://www.terraform.io/).
1. Open an [AWS account](https://aws.amazon.com/free/) if you don't have one.
1. Follow [these instructions](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) to create an access key.
1. Create and open the `~/.aws/credentials` file in your computer.
1. Add the following to `~/.aws/credentials`:

```
[default]
aws_access_key_id = < Replace with you access key id >
aws_secret_access_key = < Replace with you secret access key >
```

## Deploy infrastructure 🚀

**Note**: Deploying this infrastructure could incur some AWS costs. Make sure you [destroy the infrastructure](#destroy-infrastructure) at the end

1. Run `terraform apply`
1. Review changes and answer `yes`

## Destroy infrastructure ♻

1. Run `terraform destroy`
1. Review changes and answer `yes`
