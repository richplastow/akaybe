`Akaybe` Constructor Usage
==========================

Typical instantiation of the `Akaybe` class (called `Main` internally). 


    tudor.page    "`Akaybe` Constructor Usage"

    tudor.section "No `config` argument"

    tudor.is [

      "Class is a function"
      ªF
      -> Main

      -> new Main

      "Instance is an object"
      ªO
      (mock) -> mock

    ]

    tudor.equal [

      "`toString()` is '[object Akaybe]'"
      '[object Akaybe]'
      (mock) -> '' + mock

      "`config` is null"
      '[object Akaybe]'
      -> '' + new Main null

      "`ªI` is `mock.I`"
      ªI
      (mock) -> mock.I

      "`ªV` is `mock.V`"
      ªV
      (mock) -> mock.V

    ]

    tudor.section "Basic `config` argument"

    tudor.equal [

      "Set an unknown config key"
      '[object Akaybe]'
      -> '' + new Main { unknown:"Wasn't expecting a key called 'unknown'" }

    ]





