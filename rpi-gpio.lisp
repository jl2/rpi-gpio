;;;; rpi-gpio.lisp
;; Copyright (c) 2015, Jeremiah LaRocco <jeremiah.larocco@gmail.com>

;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package #:rpi-gpio)

(defparameter *rpi-gpio-path* "/sys/class/gpio")

(defun write-gpio (path data)
  (with-open-file (outf path :direction :output :if-exists :append)
    (write data :stream outf)))

(defun read-gpio (path)
  (with-open-file (inf path :direction :input)
    (read inf)))

(defun enable-pin (num)
  (write-gpio (format nil "~a/export"  *rpi-gpio-path*) (format nil "~a" num)))

(defun disable-pin (num)
  (write-gpio (format nil "~a/unexport" *rpi-gpio-path*) (format nil "~a" num)))

(defun set-mode (pin mode)
    (write-gpio (format nil "~a/gpio~a/direction" *rpi-gpio-path* pin) (format nil "~a" mode)))

(defun set-pin (pin value)
  (write-gpio (format nil "~a/gpio~a/value" *rpi-gpio-path* pin) value))

(defun read-pin (pin value)
  (read-gpio (format nil "~a/gpio~a/value" *rpi-gpio-path* pin)))
