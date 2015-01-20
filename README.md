# ePubCheck Helper

Filename:  epc-helper.bat

Version:  0.1.0-a

Author:  Steve Myles (steve@mylesandmyles.info)

http://projects.mylesandmyles.info/epc-helper/

License:  MIT license (see [LICENSE](https://github.com/scumdogsteev/epc-helper/blob/master/LICENSE) accompanying this distribution).

Changelog:  See [https://github.com/scumdogsteev/epc-helper/blob/master/changelog.txt](changelog.txt) accompanying this distribution.

-[ background ]-

[ePubCheck](https://github.com/IDPF/epubcheck) is a great command line utility that validates EPUB files to ensure
proper structure and formatting.  It provides a detailed log of issues, 
including improper html tags, indicating which row(s) of which file(s) 
contain the errors.  It is an invaluable resource when creating EPUB files.

ePubCheck Helper is a simple batch file that allows the user to drag and drop
an EPUB file (or a .zip file, as .epub files are renamed .zip files) to run 
ePubCheck, taking care of the command line details for you.  The script 
outputs ePubCheck's log to a .txt file in the directory with the original EPUB
file.

-[ notes ]-

I know this isn't the first utility of its kind (for instance, EPUB-CHECKER
(http://www.pagina-online.de/software/epub-checker/) seems to be a good one
and there is also the web-based EPUB validator (http://validator.idpf.org/)),
and it likely isn't the best.  I wanted to learn more about 
batch scripting and this seemed like a good way to do so.  The results might
be helpful for someone.

I am by no means an expert at batch scripting.  I welcome comments on this
script.

-[ requirements/limitations ]-

* The user must have ePubCheck installed.
* This assumes the user is running Windows (checked with Windows 7, may work
  with earlier/later versions).
* The date/time stamp on the log filename only works properly for users whose
  Windows installation uses US-formatted dates (MM-DD-YYYY).

-[ instructions ]-

***** Installation *****

1. Make sure you are running java (1.6 or above).  This is a requirement of
   ePubCheck.
2. Install ePubCheck.  The latest version (as of 2013-09-07) is 3.0.1, but 
   this should work with other versions.
3. Download the .zip file (epc-helper.zip).
4. Extract the .bat file (epc-helper.bat) to the same folder where you have
   previously installed ePubCheck.

***** Running ePubCheck Helper *****

1. Create a shortcut to epc-helper.bat in the folder where your EPUB 
   file(s) is (are) located.
2. Drag and drop an EPUB file onto the shortcut you created in step 1.
   This runs ePubCheck.
   * The script checks for a .epub extension.
   * Dragging and dropping a file with a .zip extension also works.
     ** The script copies the .zip file to a new file with the same filename
        and an extension of .epub.  (This can help save time, as it automates
		the required renaming step in EPUb creation.)
   * Dragging and dropping files with any extension other than .epub or .zip
     terminates the script.
3. When ePubCheck has finished, a pop-up window will tell you the status.
   * Successful completion:  the filename of the log file where the results 
     are stored is displayed  ("Successful" in this case refers to ePubCheck
	 running successfully, not to successful validation of the .epub file
	 itself)
   * Unsuccessful completion:  you attempted to run ePubCheck on a file with
     the wrong extension (not .epub or .zip)
   * Unsuccessful completion:  ePubCheck cannot be found in the same folder 
     where epc-helper.bat is located.  If you receive this message, make sure
	 you followed the instructions above (under "installation") and try again.
4. Check the log file for errors.  The log file's name will be 
   [EPUB name]-[date/time stamp].log.
   * The date/time stamp is added so you can easily keep track of which 
     validation attempt you are looking at.
   * Date/time stamp format:  YYYYMMDD-HH_MM_SS
   * Example:  epub-20130907-17_46_31.log
5. Fix the errors in your EPUB (as noted in the log file) and try again (go to
   step 2) if necessary.
   If your EPUB file successfully validates, congratulations!

-[ to do ]-

* Make the time stamp work with systems having non-US formatted dates

-[ acknowledgment ]-

Date parsing is taken from Rob van der Woude:
http://www.robvanderwoude.com/datetimentparse.php

-[ project home ] -

Project URL (for updates and the latest version):
http://projects.mylesandmyles.info/epc-helper/
