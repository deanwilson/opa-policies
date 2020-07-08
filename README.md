# Open policy agent policies
Policies for use with conftest and other Open Policy Agent tools

## Yum Repository Security Policies

This is a small collection of `rego` policies to detect insecure yum repository client
settings. These currently consist of:

  * `gpgcheck` being disabled
  * `baseurl` using http rather than https
  * `gpgkey` using http rather than https
  * `metalink` using http rather than https
  * `mirrorlist` using http rather than https

You can run these policies against your yum configuration files using
[conftest](https://www.conftest.dev/)
_a utility to help you write tests against structured configuration
data._ You do not need to manually download the policies, `conftest`
will do it for you.

Running against a [secure](/samples/yumrepo/basic-single-repo.repo) config file:

    conftest test -i ini --update github.com/deanwilson/opa-policies.git//yumrepo basic-single-repo.repo
    2 tests, 2 passed, 0 warnings, 0 failures

Running against an [insecure config file](/samples/yumrepo/basic-single-repo-broken.repo):

    conftest test -i ini --update github.com/deanwilson/opa-policies.git//yumrepo basic-single-repo-broken.repo

    FAIL - basic-single-repo-broken.repo - gpgcheck should be enabled in code
    FAIL - basic-single-repo-broken.repo - baseurl in code should use https URLs
    FAIL - basic-single-repo-broken.repo - gpgkey in code should use https URLs
    FAIL - basic-single-repo-broken.repo - metalink in code should use https URLs
    FAIL - basic-single-repo-broken.repo - mirrorlist in code should use https URLs

    5 tests, 0 passed, 0 warnings, 5 failures

### Author

 * [Dean Wilson](https://www.unixdaemon.net)
