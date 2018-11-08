workflow "Publish" {
  on = "push"
  resolves = [
    "Zeit Alias URL",
    "Deploy to Heroku",
    "Verify AKS deployment",
    "Verify GKE deployment",
    "Verify EKS deployment",
  ]
}

# Build

action "Build Docker image" {
  uses = "docker://docker:stable"
  args = ["build", "-t", "quotetocat", "."]
}

# Deploy Filter

action "Deploy branch filter" {
  needs = ["Build Docker image"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
