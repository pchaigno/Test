workflow "New workflow" {
  on = "push"
  resolves = [
    "new-task-1", # remove this comment and it'll parse
    /* "other", */
  ]
} 
