load("github.com/cirrus-modules/helpers", "task", "container", "script", "cache")
load("cirrus", "fs")

def node_script_task(name="test", version="latest"):
    return task(
        name=name,
        instance=container("node:%s" % version),
        instructions=[
            _node_modules_cache(),
            _run_script(name),
        ],
    )


def _run_script(name):
    if fs.exists("yarn.lock"):
        return script(name, "yarn run %s" % name)
    return script(name, "npm run %s" % name)


def _node_modules_cache():
    if fs.exists("yarn.lock"):
        return cache("node_modules", "node_modules", ["cat yarn.lock"], ["yarn install"])
    return cache("node_modules", "node_modules", ["cat package-lock.json"], ["npm ci"])
