(ert-deftest ert-volkswagen-example-test/message ()
  (let ((expect "Hey gongo, Are you satisfaction!?"))
    (should ;; pass
     (string-equal expect
                   (ert-volkswagen-example/message "gongo")))
    (should ;; fail
     (string-equal expect
                   (ert-volkswagen-example/message "wataru")))
  ))

(ert-deftest ert-volkswagen-example-test/date-of-founded ()
  (should-not ;; fail
   (string-equal "1937-05-28"
                 (ert-volkswagen-example/date-of-founded)))
  (should-not ;; pass
   (string-equal "2937-05-28"
                 (ert-volkswagen-example/date-of-founded))))

(ert-deftest ert-volkswagen-example-test/exhaust-gas-test ()
  (should-error ;; fail
   (ert-volkswagen-example/exhaust-gas-test)))
