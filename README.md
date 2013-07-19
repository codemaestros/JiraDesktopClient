Simple Utility to create 
To start using this:
First gem install jira-ruby
Then change the following constants to your preferences:

USERNAME
PASSWORD
URL
FEATURE_DIRECTORY
EXTENSION

to run this code try: 

```bash
  ruby features.rb hioshc-23
```
from the directory you have saved this in. 

KNOWN ISSUE: ONCE IN A WHILE THE JIRA API BLOCKS ACCESS TO THE APPLICATION FROM LOCAL. YOU WILL SEE THE FOLLOWING ERROR: Invalid username and /or password (RuntimeError)
To Resolve this simply log out of the JIRA web application and log back in with your correct username and password (and possibly a captcha)
i
