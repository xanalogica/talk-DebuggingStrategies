.. include:: <s5defs.txt>

===========================================
 Debugging Strategies: A Guided Discussion
===========================================

:Author: Jeff Rush <jeff@taupro.com>
:Copyright: 2012 Tau Productions Inc.
:License: Creative Commons Attribution-ShareAlike 3.0
:Duration: 25-minutes
:Difficulty: Beginner
:Keywords: debugging

A discussion of possible strategies used to debug certain kinds of problems.

http://www.dfwpython.org/static/jefftalks/DebuggingStrategies/

.. |bullet| unicode:: U+02022
.. footer:: Tau Productions Inc. |bullet| 2012

Overview
========

.. container:: slide-display

   .. class:: incremental

      + not in-depth about any particular tool
      + more about philosophy and approach

      ..

      + Tools in Your Arsenal
      + Causes of Bugs
      + The Traceback is Your Friend
      + Getting Control When Something Goes Wrong
      + A Taxonomy of Bugs and Approaches


Tools in Your Arsenal
=====================

.. container:: slide-display

   .. class:: incremental

      + *print* statement
      + Python Debugger (pdb)

        .. class:: incremental

           + starting in it
           + dropping into it at a point
           + dropping into it when a problem occurs

      ..

      + *logging* module
      + unit and functional tests
      + Python Profiler
      + the Python prompt


What are the Causes of Bugs?
============================

.. container:: slide-display

   .. class:: incremental

      + misunderstanding, of the API or requirements
      + source code got out of sync
      + assumed something about environment
      + ???


Resource Management a Major Cause of Bugs
=========================================

.. container:: slide-display

   Programs are more than their inputs!

   .. class:: incremental

      + disk resources

        .. class:: incremental

           + out of space, storage or directory
           + files in-use/locked
           + insufficient permissions

      + compute resources

        .. class:: incremental

           + out of memory, swapping
           + out of threads
           + excessive concurrency usage

      + network resources

        .. class:: incremental

           + out of sockets
           + DNS, network topology
           + restricted lower ports
           + packet chunking
           + changes in network I/O behavior


The Traceback is Your Friend
============================

.. container:: slide-display

   .. class:: incremental

      ::

        Traceback (most recent call last):
        File "c:\twisted\internet\selectreactor.py", line 146, in _doReadOrWrite
            why = getattr(selectable, method)()

      ::

        File "c:\twisted\internet\tcp.py", line 463, in doRead
            return self.protocol.dataReceived(data)
        File "c:\twisted\protocols\basic.py", line 239, in dataReceived
            return self.rawDataReceived(data)
        File "c:\twisted\words\protocols\msn.py", line 676 in rawDataReceived
            self.gotMessage(m)
        File "c:\twisted\words\protocols\msn.py", line 699, in gotMessage
            raise ValueError("A valid state must be passed in.")

      ::

        ValueError: A valid state must be passed in.

      + true cause not always last
      + pathnames may be wrong for .pyc files


Getting Control When Something Goes Wrong
=========================================

.. container:: slide-display

   .. class:: incremental

      ::

        $ python -i yourpgm.py
        >>>

      ::

        import code
        code.interact(local=locals())

      ::

        try:
            main()  # your program here
        except:
            import pdb
            pdb.post_mortem()

      ::

            import pdb; pdb.set_trace()
            # your suspect code


A Taxonomy of Bugs
==================

.. container:: slide-display

   The bug that ...

   .. class:: incremental

      + always happens
      + sometimes happens
      + only happens for someone else
      + only happens under load
      + makes a program take too long


The Bug that Always Happens
===========================

.. container:: slide-display

   .. class:: incremental

      + the print statement
      + good logging
      + single-stepping/breakpointing via pdb


The Bug that Sometimes Happens
==============================

.. container:: slide-display

   .. class:: incremental

      + reconsider your design assumptions
      + especially non-deterministic factors
        like packet chunking, network traffic

      ..

      + logging
      + "short-term" logging for rarely occurring


The Destination versus Knowing the Path
=======================================

.. container:: slide-display

   .. class:: incremental

      + Unit Tests tell you **Something Went Wrong**

        A -> B (but no knowledge of path in-btw)

      ..

      + Logging Tests tell you **Where It Went Wrong**

        A -> B (but record of exec path along the way)


The Bug that Happens Only for Someone Else
==========================================

.. container:: slide-display

   + (timezone story)

   .. class:: incremental

      + reconsider your design assumptions

        + time-of-day differences
        + network **differences**
        + more limited storage resources
        + disk permission **differences**
        + concurrency assumptions (stealth apps)
        + software installation differences

      ::

        $ python -v yourpgm.py

        (shows where you are importing stuff from)

      ..

      + logging very important (because you are not there)
      + *especially* of your environment


The Bug that Happens Only Under Load
====================================

.. container:: slide-display

   .. class:: incremental

      + reconsider your assumptions re **deallocation**

        .. class:: incremental

           + failure to collect memory garbage
           + excessive nesting of stack frames
           + delayed temporary file deletion
           + exhaustion of threads or locks

           ..

           + changes in I/O behavior (esp network)

      ..

      + use realistic unit tests


The Bug that Makes a Program Take Too Long
==========================================

.. container:: slide-display

   + besides the obvious use of a Python Profiler ...

   .. class:: incremental

      ::

        import signal

        def interrupt_handler(signum, frame):
            import pdb
            pdb.set_trace()

        # (on OSX, use signal.SIGINT instead of SIGUSR1)
        signal.signal(signal.SIGUSR1, interrupt_handler)

        main()

      ::

        signal.signal(signal.SIGALRM, interrupt_handler)

        signal.alarm(30) # 30-seconds
        do_something_timecritical()
        signal.alarm(0)  # Disable the alarm


Conclusion
==========

.. container:: slide-display

   + the perfect bug report?
   + the worst bug report?

   .. class:: huge

      Questions?

      http://www.dfwpython.org/static/jefftalks/DebuggingStrategies/

..
   XXLocal Variables:
   mode: rst
   mode: outline-minor
   End:
