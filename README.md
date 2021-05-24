# Example module

An example module that generates a task which prints `Hello, World!`.

## Usage

```
load("github.com/cirrus-modules/example", "hello_world")

def main(ctx):
  return [hello_world()]
```
