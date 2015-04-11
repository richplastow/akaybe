`Akaybe` Constructor Errors
===========================

Instantiation of the `Akaybe` class which leads to an exception being thrown. 


    tudor.page    "`Akaybe` Constructor Errors"

    tudor.section "Invalid `config` Argument"

    tudor.throws [

      "`config` is not an object"
      "Invalid `config`:\n  `candidate` is type 'number' not 'object'"
      -> new Main 1

      "`config` is a `Date` object"
      "Invalid `config`:\n  `candidate` is type 'date' not 'object'"
      -> new Main new Date

      "`config` is a `String` object"
      "Invalid `config`:\n  `candidate` is type 'string' not 'object'"
      -> new Main new String 'yikes!'

    ]

