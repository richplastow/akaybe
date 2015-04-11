Class Main
==========

#### The module’s only entry-point




Define the `Main` class
-----------------------

The `Main` class is synonymous with the module itself, so its identifier `I` 
and version `V` are the same as the module’s `ªI` and `ªV`. Note that `ªI` and 
`ªV` will be injected during the build process by `akaybe-build`, which gets 
the current title and version from ‘package.json’. 

    class Main
      I: ªI
      V: ªV
      toString: -> "[object #{@I}]"




Define private class properties
-------------------------------

By convention, private properties are prefixed with an underscore. Developers 
should avoid getting or setting these directly. 

#### `_rules`
See `ªpopulate()` for a description of the `rule` format. 

      _rules:
        config: [
        ]




Define private instance properties
----------------------------------

      constructor: (config={}) ->

#### `_c`
The instance configuration. Use `config()` to get and set it. 

        @_c = {}




Constructor functionality
-------------------------

Validate `config` against `_rules.config`, and populate `_c` if it passes. 

        if errors = ªpopulate config, @_c, @_rules.config
          throw new Error 'Invalid `config`:\n  ' + errors.join '\n  '




Define public methods
---------------------

#### `config()`
Gets or sets the current configuration. When setting configuration, `config()` 
usually returns `undefined`. However, an attempt to set the configuration to 
an invalid state will fail, and return an array of error messages. 

      config: (key, value) ->
        switch arguments.length

- `config()` returns a clone of the current configuration, as an object

          when 0
            ªclone @_c, @_rules.config


          when 1
            switch ªtype key

- `config('recognized')` returns the current value of `recognized`
- `config('X')` returns `undefined`, assuming 'X' is not a recognized key

              when ªS
                @_c[key]

- `config({a:1, b:1})` sets `a` and `b` to new values, and returns `undefined`
- `config({a:'X', b:'X'})` leaves `a` and `b` alone, returning two errors
- `config({a:1, b:'X'})` leaves `a` and `b` alone, returning one error

Note this last example: the value of `a` is valid, but because `b`’s value is 
invalid the whole operation fails, so `a`’s value remains unchanged. 

              when ªO
                ªpopulate key, @_c, @_rules.config, yes #@todo test the `updating` arg

- `config('foo', 'ok value')` sets `foo` to 'ok value', and returns `undefined`
- `config('bar', 'X')` leaves `bar` alone, and returns an error-message array

          when 2
            obj = {}
            obj[key] = value
            @config obj




