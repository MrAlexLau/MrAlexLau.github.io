---
layout: post
title: 'launchctl "nothing found to load"'
date: 2014-09-09 22:15
comments: true
categories:
---
When you get the error "nothing found to load" after running `launchctl load`. Example:
``` bash
> launchctl load ~/Library/LaunchAgents/org.virtualbox.vboxwebsrv.plist
nothing found to load
```

First check to make sure the package isn't listed as disabled in the global overrides file:
`/private/var/db/launchd.db/com.apple.launchd/overrides.plist`

If the package isn't listed in the overrides file, [launchd documentation](http://launchd.info/) offers another file it may be located in.
First get your user id by running `id` on the command line:
``` bash
> id -u
201
```

Now look in this file:
/var/db/launchd.db/com.apple.launchd.peruser.***201***/overrides.plist. The override entry should be listed in this file.

In the example given above for virtualbox, you would remove these lines from that overrides.plist file:
```
<key>org.virtualbox.vboxwebsvc</key>
<dict>
  <key>Disabled</key>
  <true/>
</dict>
```
