ert-volkswagen
==============================

Makes your tests always pass under CI.

Inspired by https://github.com/hmlb/phpunit-vw

Usage
--------------------

```lisp
(require 'ert)
(require 'ert-volkswagen)
```

If running under CI (detail described later), to enable `volkswagen-mode` (successful all test. no major/minor mode) automatically.

### Require

Emacs 24.4 or later

### Example

```
$ cd example/
$ cask
$ cask exec ert-runner
(snip)
Ran 3 tests in 0.045 seconds
3 unexpected results:
   FAILED  ert-volkswagen-example-test/date-of-founded
   FAILED  ert-volkswagen-example-test/exhaust-gas-test
   FAILED  ert-volkswagen-example-test/message

$ CI=1 cask exec ert-runner
...

Ran 3 tests in 0.000 seconds
```

### Functions

```lisp
(ert-volkswagen/on)
;; Enable volkswagen mode.

(ert-volkswagen/off)
;; Disable volkswagen mode.

(ert-volkswagen/enable-p)
;; Return t If volkswagen mode is enable.
```

Project status
--------------------

CI servers detected:

- `Jenkins`
- `TravisCI`
- `CircleCI`
- Or `export CI=1`

See also
--------------------

https://github.com/WyriHaximus/awesome-volkswagen

License
--------------------

MIT
