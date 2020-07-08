package main

empty(value) {
  count(value) == 0
}

no_violations {
  empty(violation)
}

test_deny_disabled_gpg {
    violation with input as { "code": { "baseurl": "https://packages.example.com/yumrepos/", "gpgcheck": 0 } }
}
