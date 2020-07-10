package main

## Matches the label rules in 
## https://gds-way.cloudapps.digital/manuals/programming-languages/docker.html#using-tags-and-digests-in-from-instructions
deny[msg] {
  input[i].Cmd == "from"
  val := input[i].Value

  image := val[0]

  not re_match(".+@sha256:.{64}$", image)

  msg = sprintf("FROM commands should use a sha256 hash, not a label %s", [image])
}
