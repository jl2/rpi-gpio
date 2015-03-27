;;;; package.lisp

(defpackage #:rpi-gpio
  (:use #:cl)
  (:export #:enable-pin
	   #:disable-pin
	   #:set-mode
	   #:set-pin
	   #:get-pin
	   #:in
	   #:out))

