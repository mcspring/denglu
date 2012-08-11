= Denglu

denglu library provides access to [Denglu](http://www.denglu.cc), this is unofficial ruby implementation.

= Installation

    gem install denglu

= Usage

== Initialize the comment

    require 'denglu'

    # Setup global default configurations, see Denglu::Config for more info
    Denglu::Config.app_id = 'your-app-id'
    Denglu::Config.app_key = 'your-app-key'

or use object initialize params

    require 'denglu'

    comment = Denglu::Comment.new('your-app-id', 'your-app-key')
    #=> #<Denglu::Comment:...>

== List comments

    comment.list
    #=> [{"postid" => ..., "content" => ..., "mediaID" => ..., "createTime" => ..., "state" => ..., "commentID" => ..., "parentID" => ..., ...},
    #    {...}]

== Count comments

    comment.total
    #=> [{"id" => ..., "count" => ..., "url" => ...},
    #    {...}]

= See also

* [Denglu Document](http://developer.denglu.cc/)

= Copyright

Copyright (c) 2012 Spring MC. See [LICENSE](http://github.com/mcspring/denglu/raw/master/LICENSE) for details.

