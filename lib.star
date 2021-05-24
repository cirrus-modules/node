load("github.com/cirrus-modules/helpers", "task", "container", "script", "cache")


def node_script_task():
    return task(
        name="test",
        instance=container("node:latest"),
        instructions=[
            cache("node_modules", "node_modules", ["cat package-lock.json"], ["npm ci"]),
            script("test", "npm run test"),
        ],
    )
