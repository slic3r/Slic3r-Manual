% Slic3r Support

If this manual doesn't the answer to your problem you can try several things:

IRC
---

Found on the `irc.freenode.net` server, the following chat rooms are
often filled with people who can provide real-time help:

* `#reprap`: Highly active community of the RepRap project with many
    users of Slic3r.

* `#slic3r`: Slic3r chat room where Slic3r developers and users can
    give help.

RepRap.org Forum
----------------

A dedicated [forum for Slic3r](http://forums.reprap.org/list.php?263) exists in the
RepRap forums.

Issue Tracker
-------------

If a bug may have been found in the software, or you want to raise any other
issue, you can post to the [GitHub issue tracker](http://github.com/alexrj/Slic3r/issues).

**Please** make sure you've read the guidelines below.

Guidelines for reporting an issue
---------------------------------

Keep in mind that developers are working on a volunteer basis, and the volume
of requests related to Slic3r is overwhelming, so **please** understand that 
the most **complete and clear report** you make more chances are that you'll get
help and attention.

* There is a good chance that the issue, you have encountered, is already reported.
  Please check the [list of reported issues](https://github.com/alexrj/Slic3r/issues)
  before creating a new issue report. If you find an existing issue report, feel free
  to add further information to that report.
* Include **STL file and config.ini** (exported from *File* -> *Export config...*)
  that can be used to **reproduce the issue**.
* Include **screenshots of the G-code preview** demonstrating that the issue can be
  seen in the G-code and it's not caused by mechanical problems or by the firmware.
* Specify Slic3r version (or commit number) and operating system.
* Make sure the STL file is manifold (failure to repair a broken model is not
  considered a bug; we only deal with bugs reproducible with valid models).
* Include one issue per report. If you encounter multiple, unrelated issues,
  please report them as such.

Guidelines for requesting features
----------------------------------

Slic3r is a community project, and features are usually added whenever there is
general consensus on them. Please start by describing your *goal* by showing
a concrete case. Show G-code of a real case produced with current Slic3r
and describe what would you like to improve and why. Put efforts into documenting
this with pictures, G-code preview screenshots, close inspection.

After you're focused on **why** you can move onto ideas for **how** to achieve that
goal. But don't invert the order and the efforts.
