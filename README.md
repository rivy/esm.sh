# ESMM
A fast, global content delivery network and package manager for ES Modules. All modules are transformed to ESM by [esbuild](https://github.com/evanw/esbuild) from [npm](http://npmjs.org/).

🚧 This project is work in progress.

## Import from URL
```javascript
import React from 'https://esm.sh/react'
```

### Specify version
```javascript
import React from 'https://esm.sh/react@16.13.1'
```

### Specify ESM target
```javascript
import React from 'https://esm.sh/react?target=es2020'
```

### Development mode
```javascript
import React from 'https://esm.sh/react?dev'
```

### Submodule
```javascript
import { renderToString } from 'https://esm.sh/react-dom/server'
```

### Bundle mode
```javascript
import React from 'https://esm.sh/[react,react-dom]/react'
import ReactDom from 'https://esm.sh/[react,react-dom]/react-dom'
```

or your can define bundle list in the `import-map.json` ([import-maps proposal](https://github.com/WICG/import-maps))
```json
{
    "imports": {
        "https://esm.sh/": "https://esm.sh/[react,react-dom]/",
        ...
    }
}
```

```javascript
import React from 'https://esm.sh/react' // actual from 'https://esm.sh/[react,react-dom]/react'
```

⚠️ The packages in url are litmited up to **10**, to bundle more packages, please use esmm client.


## ESMM Client
```bash
# install esmm command
deno install --allow-read --allow-write --allow-net -n esmm https://deno.land/x/esmm/cli.ts

# add some modules
$ esmm add react react-dom

# specify version or tag
$ esmm add react@16.13.1
$ esmm add react@next

# remove some modules
$ esmm remove lodash

# update installed modules
$ aleph update

# help message
$ esmm -h
```

## Self-Hosting
You will need [Go](https://golang.org/dl) 1.14+ to compile the server, and ensure the [supervisor](http://supervisord.org/) installed on your host machine.
```bash
$ sh ./scripts/deploy.sh
```
The server runtime will check the nodejs installation (12+) or install the latest LTS version automatically.
