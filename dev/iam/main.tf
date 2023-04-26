# I won't define every single policy for every single service
# because that will take a long time, but if I had time I would
# so here is an example.

# This will also create groups for dev defined in the module. (I'm assuming dev/qa/prod are separate accounts in the org)

module "iam" {
  source = "../../modules/iam"
  # We can list more policies in this list as needed.
  policies = [
    {
      policy = {
        Version = "2012-10-17",
        Statement = [
          {
            Effect = "Allow",
            # I'm very loose with dev because I'm assuming we want this to be a playground to test
            Action = ["cloudfront:*"],
            # We can get granular and only allow specific resources like specific clusters etc...
            "Resource" : "*"
          }
        ]

      }
    }
  ]
}

