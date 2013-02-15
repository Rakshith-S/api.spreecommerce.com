---
title: Contributing to Spree
---

## Overview

Spree is an open source project.  Anyone can use the code, but more importantly, anyone can contribute.  This is a group effort and we value your input.  Please consider making a contribution to help improve the Spree project.  This guide covers:

* How to file a ticket when you discover a bug
* How to contribute fixes and improvements to the core
* Information on how to improve the documentation

### Who can contribute?

Spree is an open source project and as such contributions are always welcome.  Our community is one which encourages involvement from all developers regardless of their ability level.  We ask that you be patient with the other members of the community and maintain a respectful attitude towards other people's work.  Open source is a great way to learn a new technology so don't be afraid to jump right in, even if you are new to Ruby/Rails.

### Before you contribute

Open source projects tend to be a collaborative effort.  Since many people are relying upon Spree for their real world applications, changes to the code can have major implications.  Before you write a bug fix or code a new feature, you should find out if anybody is interested in your proposed change.  You may find that the thing you're trying to "fix" is actually desired behavior.  You might also discover that someone else is working on it.  Either way you can save yourself valuable time by announcing your intentions before starting work.

#### Mailing List

One of the best places for communication is the [spree-user mailing list](http://groups.google.com/group/spree-user).  You can search this list of previous discussions and get a sense for whether you're trying to address something new.

#### IRC

There is a #spree chat room on the irc.freenode.net network. Sometimes the core contributors hang out there and you can get some feedback on your idea.

!!!
The #spree chat room is not monitored as carefully as the mailing list.  Sometimes you'll get lucky and someone will answer your question but we can't provide real time responses to everyone with a question/problem/idea.  The mailing list is a much better way to communicate, and it gives everyone the chance to provide a thoughtful response. It's also more permanent than anything discussed on IRC.
!!!

#### Notification via GitHub Issues

You can also search existing bug reports/issues and file a new one if you do not find an issue relevant to your proposed change.  See [Filing an Issue](#filing-an-issue) for more details.

***
The important thing is that you communicate your intention in advance of doing a lot of work.  Simple bug fixes and non-controversial changes do not require this approach but you can save some time by suggesting an improvement and having it rejected before you write a bunch of the code.
***

### Filing an Issue

If you would like to file a bug report, please create an issue in our [GitHub Issues Tracker](https://github.com/spree/spree/issues).  You should do a basic search of the issues database before creating a new issue to ensure that you are not creating a duplicate issue.

When filing an issue, please include steps to reproduce the issue along with details about what version of Rails and Spree that you're using.

***
Please do not assign labels or create new labels to your issue.  We will assign the appropriate labels to ensure your ticket is handled in the appropriate manner.
***

#### When to File an Issue

You should file an issue if you have found (or suspect) a bug in the "core" functionality of Spree.  If you have found a bug in one of the extensions, please file an issue with the appropriate extension project in GitHub.  If you're not sure if the behavior you're experiencing is intentional just ask on the mailing list and someone will encourage you to file a ticket if your issue sounds like a bug (as opposed to a feature.)

#### Providing a Patch

If you are filing and issue and supplying a patch at the same time, please file a ["Pull Request"](#creating-a-pull-request) instead.  The pull request will also create an issue at the same time but it's superior to just creating an issue because the code and issue can be linked.

If the ticket already exists, however, and you want to supply a patch after the fact, you can simply reference the issue number in your commit message. For example, if your commit fixed issue #123 you could use the following commit message:


	Fixed a problem with Facebook authentication.

	[Fixes #123]

GitHub will automatically detect this commit message when you push it and link the issue.  Please see the detailed [GitHub Issues](https://github.com/blog/831-issues-2-0-the-next-generation) blog post for more details.

### Feature Requests

We're interested in hearing your ideas for new features but creating feature requests in the Issue Tracker is not the proper way to ask for a feature.  A feature request is any idea you have to improve the software experience that is not strictly related to a bug or error of omission.

***
Feature requests that are accompanied by source code are always welcome.  In this case you should read the next section on [creating a pull request](#creating-a-pull-request).
***

!!!
Feature requests without accompanying code will be closed immediately.  We simply cannot respond efficiently to feature requests through our Issue Tracker.  If you want to suggest a feature, please use the [mailing list](http://groups.google.com/group/spree-user).
!!!

#### How We Prioritize Issues

Spree is a very large project with lots of activity.  We try our best to respond to all of the questions and issues our users have.  We use the following criteria to prioritize issues:

* Does this bug effect the latest stable release?
* Are there details on how to reproduce the problem?
* Is there a patch associated with the issue?
* Is there a test included in the patch?
* Has someone else verified the bug?

We give highest priority to issues where the answer is "yes" to all of these questions.  Next highest priority is for issues that answer "yes" to most of these questions, particularly the first few criteria.

***
You need to include a brief description of the problem and simple steps needed to reproduce it.  If you fail to supply this minimum level of information your issue will likely be ignored.
***

### Creating a Pull Request

If you are going to contribute code to the Spree project, the best mechanism for doing this is to create a pull request in GitHub.  If you're unfamiliar with the general concept of pull requests you may want to read more on [pull requests in GitHub](https://help.github.com/articles/using-pull-requests).

***
If your code is associated with an existing issue then you can [provide a patch](#providing-a-patch) instead of creating a pull request.
***

#### Creating a Fork

The official Spree source code is maintained in GitHub under the [spree/spree](https://github.com/spree/spree project). There is a [core team](http://spreecommerce.com/core_team) of developers who are responsible for maintaining the quality of the source code. Your changes will ultimately need to be merged into the official project by a core member.

Thanks to [GitHub](https://github.com/), however, you do not have to wait for a core member to get started with your fix.  You simply need to "fork" the project and then start hacking.

***
See the GitHub guide on [creating forks](https://help.github.com/articles/fork-a-repo) for more details.
***

#### Topic Branches

Git branches are “cheap.” Creating branches in Git is incredibly easy and it's an ideal way to isolate a specific set of changes. By keeping a specific set of changes isolated, it will help us to navigate your fork and apply only the changes we’re interested in. You should create a clean branch based on the latest spree/master when doing this. It is important you follow these steps exactly, it will prevent you from accidentally including unrelated changes from your local repository into the branch.

For example, if we were submitting a patch to fix an issue with the CSS in the flash error message you could create a branch as follows:

    $ git remote add upstream git://github.com/spree/spree.git
    $ git fetch upstream
    $ git checkout -b fix-css-for-error-flash --track upstream/master

The fetch command will grab all of the latest commits from the Spree master branch. Don’t worry, it doesn’t permanently alter your working repository and you can return to your master branch later. The track part of the command will tell git that this branch should track with the remote version of the upstream master.  This is another way of saying that the branch should be based on a clean copy of the latest official source code (without any of your unrelated local changes.)

You can then do work locally on this topic branch and push it up to your GitHub fork when you are done.  So in our previous example we do something like:

    $ git push origin fix-css-for-error-flash

Of course if you want the fix for yourself to use in your own local code you should probably merge it down to your own personal master branch that you're using for development

	$ git checkout master
	$ git merge fix-css-for-error-flash

You should probably also clean up after yourself a little.  The branch has been pushed to GitHub and you've merged it locally so you don't really need a local copy of the branch laying around.

	$ git branch -D fix-css-for-error-flash

#### Follow the Coding Conventions

Spree follows a simple set of coding style conventions.

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Indent after private/protected.
* Prefer `&&`/`||` over `and`/`or`.
* Prefer class << self block over self.method for class methods.
* `my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* `{ a + b }` and not `{a + b}`
* Follow the conventions you see used in the source already.

These are some guidelines and please use your best judgment in using them.

#### Including a Test

Ideally your pull request will also include a test that verifies a bug (or the absence of the new feature) before your fix and also verifies proper functionality when you are finished.  Please read the [testing guide](/developer/source/testing/) for more information on writing and running your tests.

***
Pull requests with tests are given top priority.  Failure to include a test will likely delay acceptance of your patch.
***

#### Creating the Pull Request

Once your code is ready to go and you have pushed your [topic branch](#topic-branches) to GitHub then you are ready to create the pull request and notify the Spree team that your contribution is ready.  You do this by browsing your project in GitHub and changing to the topic branch you just pushed.  Once you are on the topic branch simply create a pull request by pressing the "Pull Request" button.

***
The GitHub guide on [pull requests](https://help.github.com/articles/using-pull-requests) describes this in more detail with screenshots if you're still confused on this part.
***

### Contributing to the Documentation

Improvements to the documentation is encouraged.  The primary source of documentation are the guides (_HINT: You are reading one now._)  The documentation is in its own GitHub project called [spree-guides](https://github.com/spree/spree-guides/tree/master). You may make edits to the guide in your fork and then pull request for them to be updated to this site.

To build the documentation normally simply clone and install.

	$ git clone git://github.com/spree/spree-guides.git
	$ cd spree-guides
	$ bundle install
	$ bundle exec guides build
	
Then simply use the nanoc command to compile and preview the guides in your browser at http://localhost:3000

	$ nanoc compile
	$ nanoc preview

***
We are always looking for people to help us maintain the guides.  If you are interested in making several contributions (or in helping us to manage the volunteer contributions) then please send an email to [spree-user](http://groups.google.com/group/spree-user) (be sure to include your GitHub username) and say that you would like to contribute.  We'll add you to the project so you can commit directly to the guides project without having to create pull requests.
***