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
