MMS Charm
=========

Overview
--------

[The Mongo Management Service](https://mms.mongodb.com) requires that
you configure the hostname of mongo instances that the agent
is monitoring. At this time the MMS charm only supports monitoring
a single host per agent, although this will change in the future.

Usage
-----

You must choose a hostname for the machine you want the agent
to monitor and set that in the [mms console](https://mms.mongodb.com).

Because, in general, you cannot know a priori what host juju will
install the mongodb service on, the hostname you choose will not have
a mapping to a globally accessible IP address.  Instead, the MMS charm
will add a line to `/etc/hosts` with the hostname you configured and
the internal IP address discovered in the `database-relationship-changed`
hook.

Contact Information
-------------------

Max Cantor <max@docmunch.com>
