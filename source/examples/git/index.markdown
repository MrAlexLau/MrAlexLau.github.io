---
layout: page
title: "git"
date: 2014-01-12 22:51
comments: false
sharing: false
footer: true
---

### Checkout an earlier version of a branch
```
git co master@{one.month.ago}
```

### Create a new branch
**(while specifying your current branch as upstream)**
```
git co -b my_new_branch_name
```

### Deleting a branch
```
git branch -d the_local_branch
```

### Rebasing a branch
```
git rebase -i HEAD~2
```

### Pruning local branches
After fetching, remove any remote-tracking branches which no longer exist on the remote.
```
git fetch -p
```

### Undoing the latest local commit
```
git reset --soft 'HEAD^1'
```

References:

- [Deleting/pruning git branches](http://makandracards.com/makandra/621-git-delete-a-branch-local-or-remote)
- [Undoing a commit](http://stackoverflow.com/questions/927358/how-to-undo-the-last-git-commit
