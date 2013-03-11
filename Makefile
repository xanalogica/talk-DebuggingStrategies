all:	index.html

index.html: talk-DebuggingStrategies.rst
	rst2s5.py -v --theme-url=slidetheme talk-DebuggingStrategies.rst index.html
