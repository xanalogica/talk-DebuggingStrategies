talk-DebuggingStrategies
========================

Slides for my talk about debugging strategies while developing Python
programs.

History of Talk
---------------

* 2012/09/15 `PyTexas 2012 Regional Conference`_ in College Station, Texas

.. _PyTexas 2012 Regional Conference: http://www.youtube.com/watch?v=Xlz9Qwjn5Es&list=PLTjIzx6iy6PsunKpgkAffK1Bqda0K17cI&index=8


Playing the Slides
------------------

To view the slides, check out this Git repository:

::

  $ git clone https://github.com/xanalogica/talk-DebuggingStrategies.git

and point your web browser (tested with Firefox) at the index.html file:

::

  $ cd talk-DebuggingStrategies
  $ firefox index.html

Repeatedly press the <SPACEBAR> to advance to the next slide.


Technology Used for Slides
--------------------------

My slides are written in reStructuredText_, using the S5_ extensions_ for
presenting them incrementally in a web browser.  Where I use diagrams, I have
made custom CSS styling changes and slightly customized my installation of
docutils to show animated .gifs for explaining complex technical subjects.
The complete set of modified .css/.js files are bundled with each talk under
the webtheme/ directory for easier download-and-present usability.

I use Inkscape_ to create the animated diagrams, with each slide on a separate
layer.  I have a custom macro for Inkscape that exports those layers into
distinct animated .gif files that then get referenced from the
reStructuredText slides.

For all my talks I include with my slides the original .svg files from which
the animated .gifs are generated, for anyone who wants to improve or reuse
them.


.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _S5: http://meyerweb.com/eric/tools/s5/
.. _extensions: http://docutils.sourceforge.net/docs/user/slide-shows.html
.. _Inkscape: http://inkscape.org/
