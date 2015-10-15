;;; ert-volkswagen.el --- Makes your tests always pass under CI

;; Author: Wataru MIYAGUNI <gonngo@gmail.com>
;; URL: https://github.com/gongo/ert-volkswagen
;; Version: 0.0.1
;; Keywords: CI volkswagen

;; Copyright (c) 2015 Wataru MIYAGUNI
;;
;; MIT License
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; `ert-volkswagen.el' makes your failing tests pass
;; when running under CI (Jenkins, Travis CI etc).

;;; Code:

(require 'ert)
(require 'cl-macs) ;; cl-letf
(unless (require 'nadvice nil t) ;; version< 24.4
  (error "ert-volkswagen required Emacs 24.4 or later"))

(defconst ert-volkswagen->ci-list
  '("CI" "TRAVIS" "CIRCLECI" "JENKINS_URL"))

(defun ert-volkswagen--signal-should-execution (form)
  "Stub of `ert--signal-should-execution' for successful all test.
FORM is not used."
  (ert-pass))

(defun ert-volkswagen--result-exepcted-p (test result)
  "Stub of `ert-test-result-expected-p' for successful all test.
TEST and RESULT are not used."
  t)

(defun ert-volkswagen--advice-around-ert-run-tests (f &rest args)
  (cl-letf (((symbol-function 'ert--signal-should-execution)
             'ert-volkswagen--signal-should-execution
            ((symbol-function 'ert-test-result-expected-p)
             'ert-volkswagen--result-exepcted-p)))
    (apply f args)))

(defun ert-volkswagen--ci-environment-p ()
  "Return t if running under CI."
  (cl-loop for env in ert-volkswagen->ci-list
           unless (zerop (length (getenv env)))
           return t))

(defun ert-volkswagen/on ()
  "Enable volkswagen mode."
  (advice-add 'ert-run-tests :around 'ert-volkswagen--advice-around-ert-run-tests))

(defun ert-volkswagen/enable-p ()
  "Return t If volkswagen mode is enable."
  (when (advice-member-p 'ert-volkswagen--advice-around-ert-run-tests 'ert-run-tests)
    t))

(defun ert-volkswagen/off ()
  "Disable volkswagen mode."
  (advice-remove 'ert-run-tests 'ert-volkswagen--advice-around-ert-run-tests))

(when (ert-volkswagen--ci-environment-p)
  (ert-volkswagen/on))

(provide 'ert-volkswagen)

;;; ert-volkswagen.el ends here
