# Genesis

## What you need to have

* Your github credentials
* Your heroku credentials

## What this should do

Install and setup / autorun etc. for all required software. Each step of the installation process should check if it can be skipped.

Already installed software should not be installed again if at latest
version.

Output from the installed software should be piped to a log file.

### What this will install

* GCC
* Homebrew (first so /usr/local has the correct rights when rvm is run)
* RVM with ruby versions REE and 1.9.x (set as default)
* Git (with auto complete for the current shell)
* MySQL (basic setup and autorun)
* MongoDB (autorun)
* Memcached
* PostgreSQL
* ImageMagick
* QT
* wkhtmltopdf
* CTAGS?
* Heroku with credentials (should upload a ssh key for the machine)
  * MongoDB pull addon
* Github credentials