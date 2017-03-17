Health Check
================
Check your health!  Well, the health of your cluster.  This rather simple rails app presents a view into the health of 
your cluster based on the data returned from the health check.  The primary focus is on presenting a simple view of all 
your clusters, then provide drill down where appropriate.
## Basic Operation
Rails application, using Postgres, Ruby 2.4.0, Bundler, Rails 5.0.2.

To see it in action, go to: https://pure-dawn-57596.herokuapp.com/clusters (Free heroku dyno, so you may have to hit it twice)
## Things to do
With a pretty short time frame, I focused largely on basic functionality and a stab at organizing the data in a way that 
would make it easy to get a quick glance view of health for the cluster.  That being said, here are a few ideas of where to take this:
* Better spec coverage.  Behavior is still undefined, so it didn't make a lot of sense to invest time into spec coverage
* Better defined behaviors.  
* Enable the periodic checking of clusters.  There's a job, but running it repeatedly isn't useful with the existing stub data
* More stub/test data for validation of behaviors and visualizations
* Flatten the JSON into data attributes and proper relations.  Currently the JSON data structure has too strong an affect on the behavior of the app
* Well defined JSON document definition, maybe using JSON HyperSchema or something similar
* Better visualization, something akin to [OpsDash](https://www.opsdash.com/blog/postgresql-streaming-replication-howto.html)
* Historical data analysis, i.e. how does the data change over time?
* A real navigation/information architecture - presumably there are many of these nodes, and a simple list isn't going to cut it.  Better metadata about each node and its related nodes would be great, too.
* Search! It would be good to index the json data and be able to quickly find say "free space of every node" or something silly like that
