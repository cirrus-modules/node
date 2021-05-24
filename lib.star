load("github.com/cirrus-modules/helpers", "task", "container", "script")


def hello_world():
    return task(
        name="Hello World",
        instance=container("debian:latest"),
        instructions=[
            script("greeting", "echo \"Hello, World!\""),
        ],
    )
