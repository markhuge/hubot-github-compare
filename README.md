hubot-github-compare [![Build Status](https://travis-ci.org/markhuge/hubot-github-compare.svg?branch=master)](https://travis-ci.org/markhuge/hubot-github-compare)
====================

> Return Github comparison URL for 2 branches/releases on a specified repo

```
Hubot> hubot compare user/repo develop to 1.0.1
Hubot> https://github.com/user/repo/compare/develop...1.0.1
```

If you set the `HUBOT_GITHUB_USER` environmental variable, hubot will assume any repos that *are not* namespaced are in your user or org account.

`export HUBOT_GITHUB_USER=markhuge`

```
Hubot> hubot compare hubot-github-compare develop to master
Hubot> https://github.com/markhuge/hubot-github-compare/compare/develop...master
```
