(defmodule lmud-aliases
  (export all))

(defun base ()
  `((#(name "?")
     #(command "help")
     #(args ()))
    (#(name "h")
     #(command "help")
     #(args ()))
    (#(name "examine")
     #(command "look")
     #(args ()))
    (#(name "get")
     #(command "take")
     #(args ()))
    (#(name "tell")
     #(command "whisper")
     #(args ()))
    (#(name "north")
     #(command "go")
     #(args ("north")))
    (#(name "east")
     #(command "go")
     #(args ("east")))
    (#(name "west")
     #(command "go")
     #(args ("west")))
    (#(name "south")
     #(command "go")
     #(args ("south")))
    (#(name "exit")
     #(command "quit")
     #(args ()))))

(defun aliases-irc ()
  `((#(name "/?")
     #(command "help")
     #(args ()))
    (#(name "/h")
     #(command "help")
     #(args ()))
    (#(name "/help")
     #(command "help")
     #(args ()))
    (#(name "/me")
     #(command "emote")
     #(args ()))
    (#(name "/me-ns")
     #(command "emote-ns")
     #(args ()))
    (#(name "/msg")
     #(command "whisper")
     #(args ()))
    (#(name "/q")
     #(command "quit")
     #(args ()))
    (#(name "/quit")
     #(command "quit")
     #(args ()))))

(defun aliases-tinymud ()
  `((#(name "\"")
     #(command "say")
     #(args ()))
    (#(name "pose")
     #(command "emote")
     #(args ()))
    (#(name ":")
     #(command "emote")
     #(args ()))
    (#(name ";")
     #(command "emote-ns")
     #(args ()))
    (#(name "page")
     #(command "whisper")
     #(args ()))
    (#(name "'")
     #(command "whisper")
     #(args ()))
    ; (#(name '"\\\\")
    ;  #(command "whisper")
    ;  #(args ()))
    ))


; %% Below are WoW aliases/shortcuts for commands.
; % parse_cmd("?", Args, Line, Req) ->
; %   parse_cmd("say", Args, Line, Req);
; /emote -> emote
; /em -> emote
(defun aliases-wow ()
  `((#(name "/say")
     #(command "say")
     #(args ()))
    (#(name "/s")
     #(command "say")
     #(args ()))
    (#(name "/emote")
     #(command "emote")
     #(args ()))
    (#(name "/em")
     #(command "emote")
     #(args ()))
    (#(name "/e")
     #(command "emote")
     #(args ()))
    (#(name "/whisper")
     #(command "whisper")
     #(args ()))
    (#(name "/tell")
     #(command "whisper")
     #(args ()))
    (#(name "/send")
     #(command "whisper")
     #(args ()))
    (#(name "/w")
     #(command "whisper")
     #(args ()))
    (#(name "/t")
     #(command "whisper")
     #(args ()))))

(defun all ()
  `(#("Common Alias Group" ,(base))
    #("IRC Alias Group" ,(aliases-irc))
    #("TinyMU* Alias Group" ,(aliases-tinymud))
    #("WoW Alias Group" ,(aliases-wow))))

(defun get-alias (name prop-list)
  (lmud-commands:get-command name prop-list))

(defun get-command (alias-name prop-list)
  (case (get-alias alias-name (all))
    ('() '())
    (match
      (lmud-commands:get-command
        (proplists:get_value 'command (car match))
        (lmud-commands:all)))))
