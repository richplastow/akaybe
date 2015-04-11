Akaybe Helpers
==============

#### Define the core Akaybe helper functions

Akaybe’s helper functions are visible to all code defined in ‘src/’ and ‘test/’ 
but are hidden from code defined elsewhere in the runtime environment. 

- Helpers are ‘pure’ (they return the same output for a given set of arguments)
- They have no side-effects, other than throwing exceptions
- They run identically in all modern environments (browser, server, desktop, …)
- Each Akaybe helper function minifies to 1024 bytes or less




#### `ªtype()`
To detect the difference between 'null', 'array', 'regexp' and 'object' types, 
we use [Angus Croll’s one-liner](http://goo.gl/WlpBEx). This can be used in 
place of JavaScript’s familiar `typeof` operator, with one important exception: 
when the variable being tested does not exist, `typeof foobar` will return 
`undefined`, whereas `ªtype(foobar)` will throw an error. 

    ªtype = (x) ->
      ({}).toString.call(x).match(/\s([a-z|A-Z]+)/)[1].toLowerCase()




