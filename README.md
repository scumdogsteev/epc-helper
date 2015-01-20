# ePubCheck Helper

Version:  0.1.0-a

Author:  Steve Myles (steve@mylesandmyles.info)

Project Home:  http://projects.mylesandmyles.info/epc-helper/

License:  MIT license (see [LICENSE](https://github.com/scumdogsteev/epc-helper/blob/master/LICENSE) accompanying this distribution).

Changelog:  See [https://github.com/scumdogsteev/epc-helper/blob/master/changelog.txt](changelog.txt) accompanying this distribution.

### background

[ePubCheck](https://github.com/IDPF/epubcheck) is a great command line utility that validates EPUB files to ensure
proper structure and formatting.  It provides a detailed log of issues, 
including improper html tags, indicating which row(s) of which file(s) 
contain the errors.  It is an invaluable resource when creating EPUB files.

ePubCheck Helper is a simple batch file that allows the user to drag and drop
an EPUB file (or a .zip file, as .epub files are renamed .zip files) to run 
ePubCheck, taking care of the command line details for you.  The script 
outputs ePubCheck's log to a .txt file in the directory with the original EPUB
file.

### notes

I know this isn't the first utility of its kind (for instance, EPUB-CHECKER
(http://www.pagina-online.de/software/epub-checker/) seems to be a good one
and there is also the web-based EPUB validator (http://validator.idpf.org/)),
and it likely isn't the best.  I wanted to learn more about 
batch scripting and this seemed like a good way to do so.  The results might
be helpful for someone.

I am by no means an expert at batch scripting.  I welcome [comments on this
script](http://steve.mylesandmyles.info/post/60586587794/epubcheck-helper#disqus_thread).

### acknowledgment

Date parsing is taken from Rob van der Woude:
http://www.robvanderwoude.com/datetimentparse.php
