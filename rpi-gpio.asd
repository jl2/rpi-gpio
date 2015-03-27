;;;; rpi-gpio.asd

(asdf:defsystem #:rpi-gpio
  :description "Access the Raspberry Pi's GPIO pins from Common Lisp."
  :author "Jeremiah LaRocco <jeremiah.larocco@gmail.com>"
  :license "ISC"
  :serial t
  :components ((:file "package")
               (:file "rpi-gpio")))

