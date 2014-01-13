---
layout: page
title: "git"
date: 2014-01-12 22:51
comments: false 
sharing: false 
footer: true
---

### Deleting a branch
``` 
git branch -d the_local_branch
```

### Pruning local branches
After fetching, remove any remote-tracking branches which no longer exist on the remote.
```
git fetch -p 
```

References:

- [Deleting/pruning git branches](http://makandracards.com/makandra/621-git-delete-a-branch-local-or-remote)
