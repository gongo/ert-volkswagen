;;; ert-volkswagen-example.el ---

;; Author: Wataru MIYAGUNI <gonngo@gmail.com>
;; URL: https://github.com/gongo/ert-volkswagen
;; Version: 0.0.1
;; Keywords: vw

(defun ert-volkswagen-example/message (who)
  (format "Hey %s, Are you satisfaction!?" who))

(defun ert-volkswagen-example/date-of-founded ()
  "1937-05-28")

(defun ert-volkswagen-example/exhaust-gas-test ()
  t)

(provide 'ert-volkswagen-example)

;;; ert-volkswagen-example.el ends here
