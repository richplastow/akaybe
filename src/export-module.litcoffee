Export Module
=============

#### The `Main` class, ‘class-main.litcoffee’, is the module’s only entry-point

First, try defining an AMD module, eg for [RequireJS](http://requirejs.org/). 

    if ªF == typeof define and define.amd
      define -> Main

Next, try exporting for CommonJS, eg [Node](http://goo.gl/Lf84YI). 

    else if ªO == typeof module and module and module.exports
      module.exports = Main

Otherwise, add the `Main` class to global scope. Browser usage would be: 
```js
foo = new window.Foo();
```

    else @[ªI] = Main




