---
layout: page
title: "git"
date: 2014-01-12 22:51
comments: false
sharing: false
footer: true
---

### Amend a commit
Add a change to the last commit:
```
git commit --amend -m 'my new commit message'
```

### Checkout a particular version of a file
From [this StackOverflow answer](http://stackoverflow.com/a/215731):
```
git checkout SHAabcde file/to/restore
```

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

### Global Gitignore
From the [Github documentation](https://help.github.com/articles/ignoring-files#create-a-global-gitignore):
```
git config --global core.excludesfile ~/.gitignore_global
```
There's also a good [sample global gitignore file](https://gist.github.com/octocat/9257657).

### Rebasing a branch
```
git rebase -i HEAD~2
```

### Renaming a remote branch
```
git remote rename original-name new-name
```

### Removing a remote branch
```
git remote remove origin
```

### Pruning local branches
After fetching, remove any remote-tracking branches which no longer exist on the remote.
```
git fetch -p
```

### Tags
List tags:
```
git tag
```

Create a new tag:
```
git tag v201412-rc1
```

Push a tag:
```
git push origin v201412-rc1
```

### Undoing the latest local commit
```
git reset --soft 'HEAD^1'
```

References:

- [Deleting/pruning git branches](http://makandracards.com/makandra/621-git-delete-a-branch-local-or-remote)
- [Undoing a commit](http://stackoverflow.com/questions/927358/how-to-undo-the-last-git-commit
