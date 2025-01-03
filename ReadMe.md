Helm + YAMLScript
=================

This repo has 2 commits.

The first commit is the output of `helm create ys-test-chart`.

Also the output of `helm template . | ys -Ys -` saved as `.original.yaml`.
This simply reformats the YAML the way `ys` outputs it, so we can diff it with
the new output.
None of the data values are changed.

The second commit converts the Helm templates to use YAMLScript instead of the
Go templating.
It accomplishes all the same logic but with a cleaner syntax that is also valid
YAML.


## Usage

To see that the same resulting template output is produced using YAMLScript:
```
$ make realclean    # To start with no cached artifacts
$ make clean test
```

To run `helm install ...` using YAMLScript, run:
```
$ make uninstall    # In case already installed
$ make test-helm-install
```


## Comparing the Template Syntax Difference

You can see how YAMLScript compares to Helm templating by running:
```
$ git diff HEAD^ -- templates
```

Here's a nicer side-by-side comparison gist generated by a YAMLScript program:

https://gist.github.com/ingydotnet/9523716467fad01ccebcb1093b2b1f6f
