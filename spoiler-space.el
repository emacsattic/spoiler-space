;;; spoiler-space.el --- 1-key, automatically insert spoiler space

;; Copyright (C) 2001 by Tom Breton

;; Author: Tom Breton <tob@world.std.com>
;; Keywords: news, mail, convenience

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; To install, add the line 
;
;; (load "WHATEVER-PATH/spoiler-space.el") 
;;
;; anywhere in .gnus.el, where WHATEVER-PATH is wherever you put this
;; file. 

;; To use, compose a message normally in gnus.  At some point, type
;; Control-c i.  That's all.

;;; Code:

(defvar tehom-current-episode-name nil 
  "Name of the episode being spoiled" )

(defun tehom-insert-spoiler-space (&optional change-names)
   ""
  
   (interactive "P")
   (if
      (or
	 (not tehom-current-episode-name)
	 change-names)
      (setq
	 tehom-current-episode-name
	 (read-string "Name of the episode being spoiled: " 
	    nil nil "At least one episode")))

   (goto-char (point-min))
   (search-forward "--text follows this line--\n")

   (insert
      (format
	 "Spoilers for _%s_:\n%s\n"
	 tehom-current-episode-name
	 (make-string 20 ?\n ))))
(define-key message-mode-map "\C-ci" 'tehom-insert-spoiler-space)

;;; spoiler-space.el ends here
