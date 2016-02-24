# list-node-modules
Lists the names and versions of all the modules contained within your node_modules directory

If multiple copies of the same module version are found these will be listed.

## Requirements

* Perl 5.14 or greater
* A node.js project

## Usage

    ./dep_check.pl <path/to/node/project>

## Example

    ./dep_check.pl ../grunt-gemnasium
    abbrev                         1.0.7, 1.0.7
    argparse                       0.1.16
    async                          0.1.22
    balanced-match                 0.2.0
    brace-expansion                1.1.0
    cli                            0.6.6
    coffee-script                  1.3.3
    ...
    sigmund                        1.0.1, 1.0.1, 1.0.1, 1.0.1
    string_decoder                 0.10.31
    strip-json-comments            1.0.2
    underscore                     1.7.0
    underscore.string              2.2.1, 2.3.3, 2.4.0
    which                          1.0.9
