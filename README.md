# rails-scope
Ruby gem that allows nVisium to accurately and automatically scope a Ruby on Rails application for assessment purposes.

# Output will consist of

- Code complexity
- Routes
- Number of Controller, Views, and Models
- Lines of code within Controller, Views, and Models
- # and names of RubyGems in use
- brakeman output (--summary)

# Directions

Download

    git clone git@github.com:nVisium/rails-scope.git

Build

    gem build rails-scope.gemspec

Install

    # NOTE: Gem name shown below will vary because of version updates
    gem install ./rails-scope-0.0.1.gem

Run

    # NOTE: If a path is not provided or an output location is not given
    # ... the application will assume you want to either run the program in the current directory
    # or place the output file in the current directory
    
    rails-scope -p /path/to/myapp -o /path/to/output

Usage

    Usage: rails-scope [options]
    -p /var/app/current              Path to your application directory
    -o, --path /my/dir               The location you would like the scope.nv file stored
    -h, --help                       Displays help information
