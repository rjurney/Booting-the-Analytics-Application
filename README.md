Booting the Analytics Application
=================================

This is an example application you can use to get started building analytics applications using Ruby/Python, Pig/Hadoop, NoSQL stores and one-page web applications.

Installation & Setup
--------------------

### General

    ./setup.sh

### Ruby

    sudo gem install bundler
    cd src/ruby
    bundle install
    cd ../..

### Python

    
    

Creating Records
----------------

### Ruby

    cd src/ruby
    bundle exec ruby create_avros.rb
    cd ../..

### Python

    

Processing Data with Pig
------------------------

    lib/pig-0.9.1/bin/pig -l /tmp -x local src/pig/messages_per_user_id.pig

To load Pig in an interactive shell called Grunt:

    lib/pig-0.9.1/bin/pig -l /tmp -x local

and open `src/pig/messages_per_user_id.pig` and try out `DESCRIBE` and `ILLUSTRATE`.

Publishing Data with Voldemort
------------------------------

### Ruby

    cd src/ruby
    bundle exec ruby push_json.rb
    cd ../..

### Python

    

Viewing Records in a One-Page Web Application
---------------------------------------------

### Ruby

    cd src/ruby
    bundle exec ruby web.rb

### Python

    
### Browser

Now check out http://localhost:4567/messages_per_user_id/1 http://localhost:4567/messages_per_user_id/2

