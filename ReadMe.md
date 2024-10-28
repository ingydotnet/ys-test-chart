Helm + YAMLScript
=================

This repo has 2 commits.

The first commit is the output of `helm create ys-test-chart`.

Also the output of `helm template . | ys -sY -` saved as `.original.yaml`.
This simply reformats the YAML the way ys outputs it, so we can diff it with
the new output.
None of the data values are changed.

The second commit converts the Helm templates to use YAMLScript instead of the
Go templating.
It accomplishes all the same logic but with a cleaner syntax that is also valid
YAML.

Run the `make test` command to see that the same resulting YAML output is
produced.

It runs `helm template . | ys -Ys -` saved as `.manifest.yaml` and diffs it
against `.original.yaml`.
