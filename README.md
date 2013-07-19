Simple Utility to create features files from JIRA Test Cases


To start using this:

Requirements:

```
Ruby 1.9.3
```

You can get Ruby [here:](http://rubyinstaller.org/) or to get the whole shebang with Rails(recommended) go [here:](http://railsinstaller.org/)

Clone the Repository with 

```
  git clone git@github.com:codemaestros/JiraDesktopClient.git
```

You can also download this folder as zip by clicking on the download as zip link 


Then run:
```bash
  gem install jira-ruby
  ```
Then change the following constants to your preferences:
```
USERNAME
PASSWORD
URL
FEATURE_DIRECTORY
EXTENSION
```

to run this code try: 

```bash
  ruby features.rb hioshc-23
```
from the JiraDesktopClient directory 

KNOWN ISSUE: 

ONCE IN A WHILE THE JIRA API BLOCKS ACCESS TO THE APPLICATION FROM LOCAL. YOU WILL SEE THE FOLLOWING ERROR: 
```bash
Invalid username and /or password (RuntimeError)
```
To Resolve this simply log out of the JIRA web application and log back in with your correct username and password (and possibly a captcha)
i
