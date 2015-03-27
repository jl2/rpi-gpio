;;;; rpi-gpio.lisp

(in-package #:rpi-gpio)

(defparameter *rpi-gpio-path* "/sys/class/gpio")

(defun enable-pin (num)
  (with-open-file (outf (format nil "~a/export"  *rpi-gpio-path*) :direction :output :if-exists :append)
    (write-string (format nil "~a" num) outf )))

(defun disable-pin (num)
  (with-open-file (outf (format nil "~a/unexport" *rpi-gpio-path*) :direction :output :if-exists :append)
    (write-string (format nil "~a" num) outf )))

(defun set-mode (pin mode)
  (with-open-file (outf (format nil "~a/gpio~a/direction" *rpi-gpio-path* pin ) :direction :output :if-exists :append)
    (if (eq 'in mode)
	(write-string "in" outf)
	(write-string "out" outf))))

(defun set-pin (pin value)
  (with-open-file (outf (format nil "~a/gpio~a/value" *rpi-gpio-path* pin ) :direction :output :if-exists :append)
    (write value :stream outf)))

(defun read-pin (pin value)
  (with-open-file (inf (format nil "~a/gpio~a/value" *rpi-gpio-path* pin ) :direction :input)
    (read inf)))