# Node.js Module

Cirrus module to easily generate tasks to run scripts from `package.json`.
Note that this module auto-detects usage of NPM or Yarn and generates tasks accordingly.

## Usage

```python
# .cirrus.star
load("github.com/cirrus-modules/node", "node_script_task")

def main(ctx):
  return [
    node_script_task("build"),
    node_script_task("test"),
    node_script_task("prettier-check"),
    node_script_task("typecheck"),
  ]
```