package main

violation[msg] {
    configuration_block := input[configuration_block_name]

    not configuration_block.gpgcheck = 1
    msg = sprintf("gpgcheck should be enabled in %s", [configuration_block_name])
}

# does not support the multiple baseurl format as the parser drops the ones
# on additional lines as they don't follow the key / value format.
contains_urls = [
    "baseurl",
    "gpgkey",
    "metalink",
    "mirrorlist",
]

violation[msg] {
    configuration_block := input[configuration_block_name]

    config_name := contains_urls[i]

    url := input[configuration_block_name][config_name]

    contains(url, "http://")

    msg = sprintf("%s in %s should use https URLs", [config_name, configuration_block_name])
}
