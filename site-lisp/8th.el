; 8th.el: syntax highlighting for 8th
; Maintainer:   Ron Aaron <ron@aaron-tech.com>
; URL:          http://8th-dev.com/
; Filetypes:    *.8th
; Version:      18.01

(setq 8th-keywords '("a:shuffle" "shuffle" "a:join" "join" "a:indexof" "indexof" "a:dot" "dot" ) )
(setq 8th-keywords '("a:exists?" "exists?" "a:slide" "slide" "a:shift" "shift" "a:rev" "rev" ) )
(setq 8th-keywords '("a:y" "y" "a:zip" "zip" "a:clear" "clear" "a:reduce" "reduce" "a:-" "-" ) )
(setq 8th-keywords '("a:op" "op" "a:+" "+" "a:map" "map" "a:filter" "filter" "a:@" "@" "a:!" ) )
(setq 8th-keywords '("!" "a:len" "len" "a:pop" "pop" "a:push" "push" "a:op!" "op!" "a:new" ) )
(setq 8th-keywords '("new" "a:sort" "sort" "a:slice" "slice" "a:bsearch" "bsearch" "a:open" ) )
(setq 8th-keywords '("open" "a:close" "close" "a:when" "when" "a:each" "each" "a:insert" "insert" ) )
(setq 8th-keywords '("a:when!" "when!" "app:current" "current" "app:sysquit" "sysquit" "app:orientation" ) )
(setq 8th-keywords '("orientation" "app:resumed" "resumed" "app:isgui" "isgui" "app:datadir" ) )
(setq 8th-keywords '("datadir" "app:standalone" "standalone" "app:subdir" "subdir" "app:suspended" ) )
(setq 8th-keywords '("suspended" "app:pid" "pid" "app:restart" "restart" "app:basedir" "basedir" ) )
(setq 8th-keywords '("app:8thdir" "8thdir" "app:exename" "exename" "app:asset" "asset" "b:move" ) )
(setq 8th-keywords '("move" "b:mem>" "mem>" "b:hex>" "hex>" "b:conv" "conv" "b:rev" "rev" ) )
(setq 8th-keywords '("b:xor" "xor" "b:>hex" ">hex" "b:+" "+" "b:op" "op" "b:shmem" "shmem" ) )
(setq 8th-keywords '("b:>base64" ">base64" "b:base64>" "base64>" "b:len" "len" "b:compress" ) )
(setq 8th-keywords '("compress" "b:append" "append" "b:expand" "expand" "b:!" "!" "b:each-slice" ) )
(setq 8th-keywords '("each-slice" "b:@" "@" "b:fill" "fill" "b:clear" "clear" "b:/" "/" "b:writable" ) )
(setq 8th-keywords '("writable" "b:new" "new" "b:slice" "slice" "b:search" "search" "b:each" ) )
(setq 8th-keywords '("each" "b:=" "=" "con:size?" "size?" "con:save-history" "save-history" ) )
(setq 8th-keywords '("con:free" "free" "con:nouscore" "nouscore" "con:uscore" "uscore" "con:bold" ) )
(setq 8th-keywords '("bold" "con:normal" "normal" "con:nobold" "nobold" "con:onWhite" "onWhite" ) )
(setq 8th-keywords '("con:onCyan" "onCyan" "con:onMagenta" "onMagenta" "con:redir?" "redir?" ) )
(setq 8th-keywords '("con:print" "print" "con:onYellow" "onYellow" "con:onGreen" "onGreen" ) )
(setq 8th-keywords '("con:accept-pwd" "accept-pwd" "con:onRed" "onRed" "con:onBlack" "onBlack" ) )
(setq 8th-keywords '("con:white" "white" "con:cyan" "cyan" "con:magenta" "magenta" "con:yellow" ) )
(setq 8th-keywords '("yellow" "con:blue" "blue" "con:green" "green" "con:black" "black" "con:dim" ) )
(setq 8th-keywords '("dim" "con:gotoxy" "gotoxy" "con:onBlue" "onBlue" "con:getxy" "getxy" ) )
(setq 8th-keywords '("con:down" "down" "con:up" "up" "con:right" "right" "con:left" "left" ) )
(setq 8th-keywords '("con:load-history" "load-history" "con:red" "red" "con:clreol" "clreol" ) )
(setq 8th-keywords '("con:cls" "cls" "con:accept" "accept" "con:key?" "key?" "con:key" "key" ) )
(setq 8th-keywords '("cr:uuid" "uuid" "cr:>uuid" ">uuid" "cr:cpe>" "cpe>" "cr:>cpe" ">cpe" ) )
(setq 8th-keywords '("cr:edbox>" "edbox>" "cr:rsabox>" "rsabox>" "cr:edbox-sig" "edbox-sig" ) )
(setq 8th-keywords '("cr:blakehash" "blakehash" "cr:aes256gcm>" "aes256gcm>" "cr:>aes256gcm" ) )
(setq 8th-keywords '(">aes256gcm" "cr:rsabox-sig" "rsabox-sig" "cr:ensurekey" "ensurekey" ) )
(setq 8th-keywords '("cr:chachapoly" "chachapoly" "cr:aesgcm" "aesgcm" "cr:chacha20box-sig" ) )
(setq 8th-keywords '("chacha20box-sig" "cr:aes256box-sig" "aes256box-sig" "cr:sbox-sig" "sbox-sig" ) )
(setq 8th-keywords '("cr:>edbox" ">edbox" "cr:ebox-sig" "ebox-sig" "cr:OFB" "OFB" "cr:CFB" ) )
(setq 8th-keywords '("CFB" "cr:rsagenkey" "rsagenkey" "cr:ecc-verify" "ecc-verify" "cr:rsa_encrypt" ) )
(setq 8th-keywords '("rsa_encrypt" "cr:rsa_verify" "rsa_verify" "cr:rsa_decrypt" "rsa_decrypt" ) )
(setq 8th-keywords '("cr:gcm-tag-size" "gcm-tag-size" "cr:rsa_sign" "rsa_sign" "cr:genkey" ) )
(setq 8th-keywords '("genkey" "cr:>encrypt" ">encrypt" "cr:hash+" "hash+" "cr:encrypt+" "encrypt+" ) )
(setq 8th-keywords '("cr:iv?" "iv?" "cr:encrypt>" "encrypt>" "cr:>decrypt" ">decrypt" "cr:mode@" ) )
(setq 8th-keywords '("mode@" "cr:decrypt+" "decrypt+" "cr:decrypt>" "decrypt>" "cr:hash" "hash" ) )
(setq 8th-keywords '("cr:restore" "restore" "cr:hash>s" "hash>s" "cr:hash>b" "hash>b" "cr:>rsabox" ) )
(setq 8th-keywords '(">rsabox" "cr:hmac" "hmac" "cr:uuid>" "uuid>" "cr:hash!" "hash!" "cr:cipher!" ) )
(setq 8th-keywords '("cipher!" "cr:dh-genkey" "dh-genkey" "cr:cp>" "cp>" "cr:dh-secret" "dh-secret" ) )
(setq 8th-keywords '("cr:ecc-sign" "ecc-sign" "cr:dh-sign" "dh-sign" "cr:dh-verify" "dh-verify" ) )
(setq 8th-keywords '("cr:ecc-genkey" "ecc-genkey" "cr:ecc-secret" "ecc-secret" "cr:hash@" ) )
(setq 8th-keywords '("hash@" "cr:cipher@" "cipher@" "cr:unshard" "unshard" "cr:err?" "err?" ) )
(setq 8th-keywords '("cr:CBC" "CBC" "cr:mode" "mode" "cr:>cp" ">cp" "cr:aad?" "aad?" "cr:encrypt" ) )
(setq 8th-keywords '("encrypt" "cr:tag?" "tag?" "cr:shard" "shard" "cr:save" "save" "cr:randkey" ) )
(setq 8th-keywords '("randkey" "cr:decrypt" "decrypt" "cr:GCM" "GCM" "cr:CTR" "CTR" "cr:ECB" ) )
(setq 8th-keywords '("ECB" "d:+msec" "+msec" "d:>fixed" ">fixed" "d:fixed>" "fixed>" "d:>msec" ) )
(setq 8th-keywords '(">msec" "d:msec>" "msec>" "d:>unix" ">unix" "d:unix>" "unix>" "d:format" ) )
(setq 8th-keywords '("format" "d:parse" "parse" "d:join" "join" "d:/" "/" "d:=" "=" "d:-" ) )
(setq 8th-keywords '("-" "d:+" "+" "d:new" "new" "d:msec" "msec" "db:col{}" "col{}" "db:col[]" ) )
(setq 8th-keywords '("col[]" "db:sqlerrmsg" "sqlerrmsg" "db:errmsg" "errmsg" "db:mysql?" "mysql?" ) )
(setq 8th-keywords '("db:rekey" "rekey" "db:key" "key" "db:odbc?" "odbc?" "db:bind" "bind" ) )
(setq 8th-keywords '("db:col" "col" "db:exec-cb" "exec-cb" "db:exec" "exec" "db:prepare" "prepare" ) )
(setq 8th-keywords '("db:open" "open" "db:err?" "err?" "db:close" "close" "dbg:prompt" "prompt" ) )
(setq 8th-keywords '("dbg:trace" "trace" "dbg:trace-leave" "trace-leave" "dbg:trace-enter" ) )
(setq 8th-keywords '("trace-enter" "dbg:bp" "bp" "dbg:go" "go" "dbg:stop" "stop" "f:eachline" ) )
(setq 8th-keywords '("eachline" "f:include" "include" "f:append" "append" "f:enssep" "enssep" ) )
(setq 8th-keywords '("f:unzip" "unzip" "f:unzip-entry" "unzip-entry" "f:print" "print" "f:canwrite?" ) )
(setq 8th-keywords '("canwrite?" "f:mmap-range?" "mmap-range?" "f:mmap-range" "mmap-range" ) )
(setq 8th-keywords '("f:mmap" "mmap" "f:glob-nocase" "glob-nocase" "f:show" "show" "f:glob" ) )
(setq 8th-keywords '("glob" "f:popen" "popen" "f:ctime" "ctime" "f:rglob" "rglob" "f:close" ) )
(setq 8th-keywords '("close" "f:relpath" "relpath" "f:slurp" "slurp" "f:open-ro" "open-ro" ) )
(setq 8th-keywords '("f:sep" "sep" "f:fname" "fname" "f:dname" "dname" "f:dir?" "dir?" "f:seek" ) )
(setq 8th-keywords '("seek" "f:exists?" "exists?" "f:stdout" "stdout" "f:launch" "launch" ) )
(setq 8th-keywords '("f:zipnew" "zipnew" "f:chmod" "chmod" "f:zipsave" "zipsave" "f:mtime" ) )
(setq 8th-keywords '("mtime" "f:atime" "atime" "f:zip+" "zip+" "f:zipopen" "zipopen" "f:zip@" ) )
(setq 8th-keywords '("zip@" "f:size" "size" "f:write" "write" "f:zipentry" "zipentry" "f:mkdir" ) )
(setq 8th-keywords '("mkdir" "f:getline" "getline" "f:eachbuf" "eachbuf" "f:open" "open" "f:flush" ) )
(setq 8th-keywords '("flush" "f:stdin" "stdin" "f:create" "create" "f:times" "times" "f:getmod" ) )
(setq 8th-keywords '("getmod" "f:stderr" "stderr" "f:link>" "link>" "f:rm" "rm" "f:rmdir" ) )
(setq 8th-keywords '("rmdir" "f:mv" "mv" "f:read" "read" "f:trash" "trash" "f:associate" "associate" ) )
(setq 8th-keywords '("f:writen" "writen" "f:tell" "tell" "f:link?" "link?" "f:err?" "err?" ) )
(setq 8th-keywords '("f:link" "link" "f:abspath" "abspath" "f:copy" "copy" "f:copydir" "copydir" ) )
(setq 8th-keywords '("font:info" "info" "font:styles?" "styles?" "font:face?" "face?" "font:glyph-path" ) )
(setq 8th-keywords '("glyph-path" "font:glyph-pos" "glyph-pos" "font:measure" "measure" "font:bold" ) )
(setq 8th-keywords '("bold" "font:italic" "italic" "font:points?" "points?" "font:pixels?" ) )
(setq 8th-keywords '("pixels?" "font:points" "points" "font:pixels" "pixels" "font:underline" ) )
(setq 8th-keywords '("underline" "font:styles" "styles" "font:ls" "ls" "font:new" "new" "g:allow-orient" ) )
(setq 8th-keywords '("allow-orient" "g:menu-update" "menu-update" "g:btn-font" "btn-font" ) )
(setq 8th-keywords '("g:update" "update" "g:cp" "cp" "g:fit-text" "fit-text" "g:justify" "justify" ) )
(setq 8th-keywords '("g:vpos!" "vpos!" "g:vpos@" "vpos@" "g:draw-text-at" "draw-text-at" "g:mouse?" ) )
(setq 8th-keywords '("mouse?" "g:popmenu" "popmenu" "g:toggle-row" "toggle-row" "g:s>path" ) )
(setq 8th-keywords '("s>path" "g:mousepos?" "mousepos?" "g:showtooltip" "showtooltip" "g:list-" ) )
(setq 8th-keywords '("list-" "g:push" "push" "g:stackix" "stackix" "g:getpath" "getpath" "g:qbezier" ) )
(setq 8th-keywords '("qbezier" "g:+path" "+path" "g:>img" ">img" "g:image-at" "image-at" "g:stroke-fill" ) )
(setq 8th-keywords '("stroke-fill" "g:waitcursor" "waitcursor" "g:panel-size?" "panel-size?" ) )
(setq 8th-keywords '("g:panel-size" "panel-size" "g:rrect" "rrect" "g:m!" "m!" "g:pix!" "pix!" ) )
(setq 8th-keywords '("g:gui?" "gui?" "g:timer!" "timer!" "g:get-tab" "get-tab" "g:set-popup-font" ) )
(setq 8th-keywords '("set-popup-font" "g:msgdlg" "msgdlg" "g:tabname" "tabname" "g:state" ) )
(setq 8th-keywords '("state" "g:fillall" "fillall" "g:state?" "state?" "g:flex!" "flex!" "g:user!" ) )
(setq 8th-keywords '("user!" "g:user" "user" "g:m@" "m@" "g:each" "each" "g:select@" "select@" ) )
(setq 8th-keywords '("g:select!" "select!" "g:bubble" "bubble" "g:callout" "callout" "g:timer@" ) )
(setq 8th-keywords '("timer@" "g:getclr" "getclr" "g:view" "view" "g:clr>n" "clr>n" "g:do" ) )
(setq 8th-keywords '("do" "g:laf!" "laf!" "g:laf" "laf" "g:set-range" "set-range" "g:menuenabled" ) )
(setq 8th-keywords '("menuenabled" "g:tree-open" "tree-open" "g:draw-fitted-text" "draw-fitted-text" ) )
(setq 8th-keywords '("g:clear" "clear" "g:show-pct" "show-pct" "g:set-long-press" "set-long-press" ) )
(setq 8th-keywords '("g:outlinethickness" "outlinethickness" "g:rowheight" "rowheight" "g:file-filter" ) )
(setq 8th-keywords '("file-filter" "g:text-box-style" "text-box-style" "g:style" "style" "g:path>s" ) )
(setq 8th-keywords '("path>s" "g:file-name" "file-name" "g:next" "next" "g:edit-on-double-click" ) )
(setq 8th-keywords '("edit-on-double-click" "g:transition" "transition" "g:connectededges" ) )
(setq 8th-keywords '("connectededges" "g:scrollthickness" "scrollthickness" "g:readonly" "readonly" ) )
(setq 8th-keywords '("g:loadcontent" "loadcontent" "g:list+" "list+" "g:stepsize" "stepsize" ) )
(setq 8th-keywords '("g:button-size" "button-size" "g:ontop" "ontop" "g:deselect-row" "deselect-row" ) )
(setq 8th-keywords '("g:sectionenable" "sectionenable" "g:headerheight" "headerheight" "g:vertical" ) )
(setq 8th-keywords '("vertical" "g:setheader" "setheader" "g:prev" "prev" "g:tooltip" "tooltip" ) )
(setq 8th-keywords '("g:propval@" "propval@" "g:propval!" "propval!" "g:fcolor" "fcolor" "g:size" ) )
(setq 8th-keywords '("size" "g:pos?" "pos?" "g:add-items" "add-items" "g:set-swipe" "set-swipe" ) )
(setq 8th-keywords '("g:progress-task-msg" "progress-task-msg" "g:progress-task-pct" "progress-task-pct" ) )
(setq 8th-keywords '("g:say" "say" "g:menu-font" "menu-font" "g:progress-task" "progress-task" ) )
(setq 8th-keywords '("g:>progress" ">progress" "g:dismiss" "dismiss" "g:showmenu" "showmenu" ) )
(setq 8th-keywords '("g:scolor" "scolor" "g:bounds?" "bounds?" "g:bounds" "bounds" "g:fullscreen" ) )
(setq 8th-keywords '("fullscreen" "g:pop" "pop" "g:root-item-visible" "root-item-visible" ) )
(setq 8th-keywords '("g:on" "on" "g:on?" "on?" "g:empty-text" "empty-text" "g:visible?" "visible?" ) )
(setq 8th-keywords '("g:enabled?" "enabled?" "g:enable" "enable" "g:+kind" "+kind" "g:getimage" ) )
(setq 8th-keywords '("getimage" "g:setimage" "setimage" "g:image" "image" "g:center" "center" ) )
(setq 8th-keywords '("g:invalidate" "invalidate" "g:restore" "restore" "g:translate" "translate" ) )
(setq 8th-keywords '("g:contrasting" "contrasting" "g:gradient" "gradient" "g:box-label" "box-label" ) )
(setq 8th-keywords '("g:/path" "/path" "g:bezier" "bezier" "g:autohide" "autohide" "g:c-text" ) )
(setq 8th-keywords '("c-text" "g:r-text" "r-text" "g:selected-rows" "selected-rows" "g:quit" ) )
(setq 8th-keywords '("quit" "g:path" "path" "g:new" "new" "g:editable" "editable" "g:ix?" ) )
(setq 8th-keywords '("ix?" "g:draw-text" "draw-text" "g:set-lasso" "set-lasso" "g:get-lasso-items" ) )
(setq 8th-keywords '("get-lasso-items" "g:hide" "hide" "g:show" "show" "g:bg" "bg" "g:name" ) )
(setq 8th-keywords '("name" "g:adjustwidth" "adjustwidth" "g:xy" "xy" "g:fg" "fg" "g:settab" ) )
(setq 8th-keywords '("settab" "g:line-width" "line-width" "g:xy?" "xy?" "g:fg?" "fg?" "g:textsize" ) )
(setq 8th-keywords '("textsize" "g:setroot" "setroot" "g:bg?" "bg?" "g:arc" "arc" "g:coleven" ) )
(setq 8th-keywords '("coleven" "g:colordlg" "colordlg" "g:parent" "parent" "g:default-font" ) )
(setq 8th-keywords '("default-font" "g:localize" "localize" "g:show-line-numbers" "show-line-numbers" ) )
(setq 8th-keywords '("g:rotate" "rotate" "g:setfont" "setfont" "g:fb-files" "fb-files" "g:handle" ) )
(setq 8th-keywords '("handle" "g:set-value" "set-value" "g:fade" "fade" "g:focus" "focus" ) )
(setq 8th-keywords '("g:text?" "text?" "g:getfont" "getfont" "g:text" "text" "g:updateitems" ) )
(setq 8th-keywords '("updateitems" "g:save" "save" "g:setname" "setname" "g:fill" "fill" "g:multi" ) )
(setq 8th-keywords '("multi" "g:lineto" "lineto" "g:obj" "obj" "g:buttons-visible" "buttons-visible" ) )
(setq 8th-keywords '("g:child" "child" "g:moveto" "moveto" "g:keyinfo" "keyinfo" "g:+child" ) )
(setq 8th-keywords '("+child" "g:-child" "-child" "g:len" "len" "g:root" "root" "g:triangle" ) )
(setq 8th-keywords '("triangle" "g:colwidth" "colwidth" "g:getroot" "getroot" "g:setcursor" ) )
(setq 8th-keywords '("setcursor" "g:textcolor" "textcolor" "g:curmouse?" "curmouse?" "g:scale" ) )
(setq 8th-keywords '("scale" "g:winding" "winding" "g:arc2" "arc2" "g:laf?" "laf?" "g:pie" ) )
(setq 8th-keywords '("pie" "g:stroke" "stroke" "g:rect" "rect" "g:clearpath" "clearpath" "g:size?" ) )
(setq 8th-keywords '("size?" "g:l-text" "l-text" "G:#match" "#match" "G:.stats" ".stats" "G:<#>" ) )
(setq 8th-keywords '("<#>" "G:#>" "#>" "G:(with)" "(with)" "G:needs" "needs" "G:(needs)" "(needs)" ) )
(setq 8th-keywords '("G:thrownull" "thrownull" "G:os>name" "os>name" "G:os-names" "os-names" ) )
(setq 8th-keywords '("G:chdir" "chdir" "G:+listener" "+listener" "G:;with" ";with" "G:setenv" ) )
(setq 8th-keywords '("setenv" "G:getenv" "getenv" "G:typeassert" "typeassert" "G:sh" "sh" ) )
(setq 8th-keywords '("G:caseof" "caseof" "G:assert" "assert" "G:long-days" "long-days" "G:libc" ) )
(setq 8th-keywords '("libc" "G:long-months" "long-months" "G:.r" ".r" "G:words/" "words/" ) )
(setq 8th-keywords '("G:`" "`" "G:string?" "string?" "G:quote" "quote" "G:-rot" "-rot" "G:2drop" ) )
(setq 8th-keywords '("2drop" "G:scriptdir" "scriptdir" "G:fourth" "fourth" "G:2swap" "2swap" ) )
(setq 8th-keywords '("G:third" "third" "G:pick" "pick" "G:tuck" "tuck" "G:prompt" "prompt" ) )
(setq 8th-keywords '("G:appname" "appname" "G:tell-conflict" "tell-conflict" "G:puts" "puts" ) )
(setq 8th-keywords '("G:space" "space" "G:getc" "getc" "G:tab-hook" "tab-hook" "G:rdrop" "rdrop" ) )
(setq 8th-keywords '("G:#!" "#!" "G:on" "on" "G:off" "off" "G:\\" "\\" "G:free" "free" "G:array?" ) )
(setq 8th-keywords '("array?" "G:dup?" "dup?" "G:number?" "number?" "G:null;" "null;" "G:0;" ) )
(setq 8th-keywords '("0;" "G:'" "'" "G:compat-level" "compat-level" "G:buildver?" "buildver?" ) )
(setq 8th-keywords '("G:bits" "bits" "G:log-time-local" "log-time-local" "G:sh$" "sh$" "G:rot" ) )
(setq 8th-keywords '("rot" "G:ahead" "ahead" "G:log-async" "log-async" "G:log-time" "log-time" ) )
(setq 8th-keywords '("G:eval0" "eval0" "G:xchg" "xchg" "G:hex" "hex" "G:pool-allot" "pool-allot" ) )
(setq 8th-keywords '("G:sem>name" "sem>name" "G:locals:" "locals:" "G:null?" "null?" "G:ns?" ) )
(setq 8th-keywords '("ns?" "G:(code)" "(code)" "G:roll" "roll" "G:build?" "build?" "G:???" ) )
(setq 8th-keywords '("???" "G:randbuf-pcg" "randbuf-pcg" "G:jcall" "jcall" "G:jmethod" "jmethod" ) )
(setq 8th-keywords '("G:reg!" "reg!" "G:stat" "stat" "G:stack-size" "stack-size" "G:sem-wait" ) )
(setq 8th-keywords '("sem-wait" "G:sem-post" "sem-post" "G:execnull" "execnull" "G:invalid-throw" ) )
(setq 8th-keywords '("invalid-throw" "G:tempfilename" "tempfilename" "G:sysregion" "sysregion" ) )
(setq 8th-keywords '("G:syslang" "syslang" "G:;;;" ";;;" "G:2over" "2over" "G:clip>" "clip>" ) )
(setq 8th-keywords '("G:ns>s" "ns>s" "G:rstack" "rstack" "G:isa?" "isa?" "G:fnv" "fnv" "G:-listener" ) )
(setq 8th-keywords '("-listener" "G:cr" "cr" "G:onexit" "onexit" "G:header" "header" "G:short-days" ) )
(setq 8th-keywords '("short-days" "G:handler" "handler" "G:compile?" "compile?" "G:compile" ) )
(setq 8th-keywords '("compile" "G:literal" "literal" "G:(*" "(*" "G:apropos" "apropos" "G:if;" ) )
(setq 8th-keywords '("if;" "G:func:" "func:" "G:scriptfile" "scriptfile" "G:gets" "gets" "G:lib" ) )
(setq 8th-keywords '("lib" "G:nip" "nip" "G:.needs" ".needs" "G:var" "var" "G:unlock" "unlock" ) )
(setq 8th-keywords '("G:json-nesting" "json-nesting" "G:locked?" "locked?" "G:recurse" "recurse" ) )
(setq 8th-keywords '("G:lock" "lock" "G:ns>ls" "ns>ls" "G:rand-pcg-seed" "rand-pcg-seed" "G:#if" ) )
(setq 8th-keywords '("#if" "G:dstack" "dstack" "G:rand-pcg" "rand-pcg" "G:2dup" "2dup" "G:var," ) )
(setq 8th-keywords '("var," "G:rand" "rand" "G:8thver?" "8thver?" "G:new" "new" "G:clone-shallow" ) )
(setq 8th-keywords '("clone-shallow" "G:clone" "clone" "G:putslim" "putslim" "G:>clip" ">clip" ) )
(setq 8th-keywords '("G:@" "@" "G:-ref" "-ref" "G:pack" "pack" "G:null" "null" "G:listener@" ) )
(setq 8th-keywords '("listener@" "G:-Inf" "-Inf" "G:<#" "<#" "G:sleep" "sleep" "G:Inf" "Inf" ) )
(setq 8th-keywords '("G:help" "help" "G:NaN" "NaN" "G:mobile?" "mobile?" "G:type-check" "type-check" ) )
(setq 8th-keywords '("G:false" "false" "G:true" "true" "G:>kind" ">kind" "G:pool-clear" "pool-clear" ) )
(setq 8th-keywords '("G:name>sem" "name>sem" "G:unpack" "unpack" "G:;;" ";;" "G:getcwd" "getcwd" ) )
(setq 8th-keywords '("G:short-months" "short-months" "G:conflict" "conflict" "G:r@" "r@" "G:case" ) )
(setq 8th-keywords '("case" "G:set-wipe" "set-wipe" "G:r>" "r>" "G:with:" "with:" "G:>r" ">r" ) )
(setq 8th-keywords '("G:.s" ".s" "G:and" "and" "G:rswap" "rswap" "G:xor" "xor" "G:words" "words" ) )
(setq 8th-keywords '("G:map?" "map?" "G:not" "not" "G:argc" "argc" "G:else" "else" "G:tempdir" ) )
(setq 8th-keywords '("tempdir" "G:if" "if" "G:(stat)" "(stat)" "G:drop" "drop" "G:swap" "swap" ) )
(setq 8th-keywords '("G:dup" "dup" "G:(putslim)" "(putslim)" "G:``" "``" "G:(gets)" "(gets)" ) )
(setq 8th-keywords '("G:.with" ".with" "G:curlang" "curlang" "G:break?" "break?" "G:ns:" "ns:" ) )
(setq 8th-keywords '("G:const" "const" "G:ref@" "ref@" "G:ns" "ns" "G:log" "log" "G:op!" "op!" ) )
(setq 8th-keywords '("G:die" "die" "G:>json" ">json" "G:json-pretty" "json-pretty" "G:json>" ) )
(setq 8th-keywords '("json>" "G:dump" "dump" "G:decimal" "decimal" "G:lock-to" "lock-to" "G:same?" ) )
(setq 8th-keywords '("same?" "G:(interp)" "(interp)" "G:(puts)" "(puts)" "G:reset" "reset" ) )
(setq 8th-keywords '("G:i;" "i;" "G:noop" "noop" "G::" ":" "G:prior" "prior" "G:putc" "putc" ) )
(setq 8th-keywords '("G:recurse-stack" "recurse-stack" "G:jclass" "jclass" "G:only" "only" ) )
(setq 8th-keywords '("G:cold" "cold" "G:--" "--" "G:step" "step" "G:over" "over" "G:eval" ) )
(setq 8th-keywords '("eval" "G:reg@" "reg@" "G:p:" "p:" "G:again" "again" "G:regbin@" "regbin@" ) )
(setq 8th-keywords '("G:eval!" "eval!" "G:parseln" "parseln" "G:repeat" "repeat" "G:semi-throw" ) )
(setq 8th-keywords '("semi-throw" "G:depth" "depth" "G:(say)" "(say)" "G:last" "last" "G:parsech" ) )
(setq 8th-keywords '("parsech" "G:throw" "throw" "G:rusage" "rusage" "G:sem" "sem" "G:base" ) )
(setq 8th-keywords '("base" "G:then" "then" "G:parsews" "parsews" "G:!" "!" "G:parse" "parse" ) )
(setq 8th-keywords '("G:os" "os" "G:randbuf" "randbuf" "G:(" "(" "G:8thdt?" "8thdt?" "G:or" ) )
(setq 8th-keywords '("or" "G:)" ")" "G:l:" "l:" "G:##" "##" "G:c#" "c#" "G:+ref" "+ref" "G:bye" ) )
(setq 8th-keywords '("bye" "G:deg>rad" "deg>rad" "G:words-like" "words-like" "G:n#" "n#" "G:.ver" ) )
(setq 8th-keywords '(".ver" "G:stack-check" "stack-check" "G:.#" ".#" "G:rad>deg" "rad>deg" ) )
(setq 8th-keywords '("G:>s" ">s" "G:,#" ",#" "G:break" "break" "G:while" "while" "G:(:)" "(:)" ) )
(setq 8th-keywords '("G:i:" "i:" "G:;" ";" "G:defer:" "defer:" "G:;then" ";then" "G:times" ) )
(setq 8th-keywords '("times" "G:sem-wait?" "sem-wait?" "G:loop" "loop" "G:loop-" "loop-" "G:>n" ) )
(setq 8th-keywords '(">n" "G:." "." "G:args" "args" "G:(putc)" "(putc)" "G:while!" "while!" ) )
(setq 8th-keywords '("G:(getc)" "(getc)" "h:+" "+" "h:len" "len" "h:clear" "clear" "h:peek" ) )
(setq 8th-keywords '("peek" "h:pop" "pop" "h:push" "push" "h:new" "new" "hw:arm?" "arm?" "hw:sms" ) )
(setq 8th-keywords '("sms" "hw:phone" "phone" "hw:phone?" "phone?" "hw:camera-fmt" "camera-fmt" ) )
(setq 8th-keywords '("hw:camera-img" "camera-img" "hw:camera" "camera" "hw:dial" "dial" "hw:camera?" ) )
(setq 8th-keywords '("camera?" "hw:sensor" "sensor" "hw:start" "start" "hw:poll" "poll" "hw:stop" ) )
(setq 8th-keywords '("stop" "hw:mac?" "mac?" "hw:device?" "device?" "hw:mem?" "mem?" "hw:cpu?" ) )
(setq 8th-keywords '("cpu?" "hw:displaysize?" "displaysize?" "hw:displays?" "displays?" "I:(op!post)" ) )
(setq 8th-keywords '("(op!post)" "I:(op!pre)" "(op!pre)" "I:lw" "lw" "I:inner/" "inner/" "I:#else?" ) )
(setq 8th-keywords '("#else?" "I:lh" "lh" "I:scriptmap" "scriptmap" "I:-scriptfile" "-scriptfile" ) )
(setq 8th-keywords '("I:+scriptfile" "+scriptfile" "I:(include)" "(include)" "I:((include))" ) )
(setq 8th-keywords '("((include))" "I:(null?)" "(null?)" "I:say" "say" "I:(msgdlg)" "(msgdlg)" ) )
(setq 8th-keywords '("I:btn-cvt" "btn-cvt" "I:md-click" "md-click" "I:_getcwd" "_getcwd" "I:msgdlg-print" ) )
(setq 8th-keywords '("msgdlg-print" "I:_setenv" "_setenv" "I:buf?" "buf?" "I:needs_ma" "needs_ma" ) )
(setq 8th-keywords '("I:(scriptdir)" "(scriptdir)" "I:(scriptfile)" "(scriptfile)" "I:sh" ) )
(setq 8th-keywords '("sh" "img:copy" "copy" "img:scroll" "scroll" "img:fill" "fill" "img:data" ) )
(setq 8th-keywords '("data" "img:rotate" "rotate" "img:flip" "flip" "img:crop" "crop" "img:filter" ) )
(setq 8th-keywords '("filter" "img:desat" "desat" "img:from-svg" "from-svg" "img:>file" ">file" ) )
(setq 8th-keywords '("img:pix!" "pix!" "img:pix@" "pix@" "img:size" "size" "img:scale" "scale" ) )
(setq 8th-keywords '("img:new" "new" "m:@?" "@?" "m:!?" "!?" "m:op!" "op!" "m:new" "new" "m:open" ) )
(setq 8th-keywords '("open" "m:+?" "+?" "m:data" "data" "m:map" "map" "m:exists?" "exists?" ) )
(setq 8th-keywords '("m:clear" "clear" "m:each" "each" "m:-" "-" "m:keys" "keys" "m:+" "+" ) )
(setq 8th-keywords '("m:@" "@" "m:!" "!" "m:len" "len" "n:~=" "~=" "n:between" "between" "n:E" ) )
(setq 8th-keywords '("E" "n:PI" "PI" "n:clamp" "clamp" "n:*/" "*/" "n:+!" "+!" "n:invmod" ) )
(setq 8th-keywords '("invmod" "n:expmod" "expmod" "n:lcm" "lcm" "n:ln" "ln" "n:atan" "atan" ) )
(setq 8th-keywords '("n:exp" "exp" "n:=" "=" "n:sin" "sin" "n:cos" "cos" "n:tan" "tan" "n:atan2" ) )
(setq 8th-keywords '("atan2" "n:asin" "asin" "n:acos" "acos" "n:band" "band" "n:bor" "bor" ) )
(setq 8th-keywords '("n:bxor" "bxor" "n:int" "int" "n:/" "/" "n:neg" "neg" "n:^" "^" "n:gcd" ) )
(setq 8th-keywords '("gcd" "n:frac" "frac" "n:round" "round" "n:abs" "abs" "n:<" "<" "n:trunc" ) )
(setq 8th-keywords '("trunc" "n:bfloat" "bfloat" "n:floor" "floor" "n:ceil" "ceil" "n:bint" ) )
(setq 8th-keywords '("bint" "n:float" "float" "n:sqr" "sqr" "n:>" ">" "n:sqrt" "sqrt" "n:1+" ) )
(setq 8th-keywords '("1+" "n:1-" "1-" "n:+" "+" "n:bnot" "bnot" "n:*" "*" "n:mod" "mod" "n:sgn" ) )
(setq 8th-keywords '("sgn" "n:/mod" "/mod" "n:-" "-" "n:cmp" "cmp" "n:min" "min" "n:max" "max" ) )
(setq 8th-keywords '("n:kind?" "kind?" "n:shl" "shl" "n:shr" "shr" "n:round2" "round2" "n:prime?" ) )
(setq 8th-keywords '("prime?" "net:err>s" "err>s" "net:PROTO_TCP" "PROTO_TCP" "net:INET6" ) )
(setq 8th-keywords '("INET6" "net:PROTO_UDP" "PROTO_UDP" "net:INET4" "INET4" "net:STREAM" ) )
(setq 8th-keywords '("STREAM" "net:ifaces?" "ifaces?" "net:recvfrom" "recvfrom" "net:DGRAM" ) )
(setq 8th-keywords '("DGRAM" "net:getpeername" "getpeername" "net:sendto" "sendto" "net:setsockopt" ) )
(setq 8th-keywords '("setsockopt" "net:again?" "again?" "net:tlshello" "tlshello" "net:opts" ) )
(setq 8th-keywords '("opts" "net:browse" "browse" "net:wait" "wait" "net:url>" "url>" "net:server" ) )
(setq 8th-keywords '("server" "net:>url" ">url" "net:listen" "listen" "net:connect" "connect" ) )
(setq 8th-keywords '("net:bind" "bind" "net:getaddrinfo" "getaddrinfo" "net:socket" "socket" ) )
(setq 8th-keywords '("net:accept" "accept" "net:addrinfo>o" "addrinfo>o" "net:err?" "err?" ) )
(setq 8th-keywords '("net:write" "write" "net:read" "read" "net:close" "close" "ns:I" "I" ) )
(setq 8th-keywords '("ns:t" "t" "ns:font" "font" "ns:X" "X" "ns:con" "con" "ns:img" "img" ) )
(setq 8th-keywords '("ns:net" "net" "ns:g" "g" "ns:q" "q" "ns:h" "h" "ns:#" "#" "ns:hw" "hw" ) )
(setq 8th-keywords '("ns:cr" "cr" "ns:sql" "sql" "ns:f" "f" "ns:r" "r" "ns:db" "db" "ns:T" ) )
(setq 8th-keywords '("T" "ns:d" "d" "ns:user" "user" "ns:C" "C" "ns:xml" "xml" "ns:w" "w" ) )
(setq 8th-keywords '("ns:ptr" "ptr" "ns:v" "v" "ns:b" "b" "ns:m" "m" "ns:app" "app" "ns:dbg" ) )
(setq 8th-keywords '("dbg" "ns:a" "a" "ns:st" "st" "ns:s" "s" "ns:n" "n" "ns:G" "G" "ns:ns" ) )
(setq 8th-keywords '("ns" "ns:ctx" "ctx" "ptr:len" "len" "ptr:unpack_orig" "unpack_orig" "ptr:cast" ) )
(setq 8th-keywords '("cast" "ptr:unpack" "unpack" "ptr:pack" "pack" "q:wait" "wait" "q:notify" ) )
(setq 8th-keywords '("notify" "q:pick" "pick" "q:size" "size" "q:overwrite" "overwrite" "q:slide" ) )
(setq 8th-keywords '("slide" "q:shift" "shift" "q:+" "+" "q:throwing" "throwing" "q:clear" ) )
(setq 8th-keywords '("clear" "q:len" "len" "q:peek" "peek" "q:pop" "pop" "q:push" "push" "q:new" ) )
(setq 8th-keywords '("new" "r:/" "/" "r:rx" "rx" "r:str" "str" "r:len" "len" "r:err?" "err?" ) )
(setq 8th-keywords '("r:@" "@" "r:++match" "++match" "r:+match" "+match" "r:match" "match" ) )
(setq 8th-keywords '("r:new" "new" "s:=ic" "=ic" "s:days!" "days!" "s:months!" "months!" "s:rsearch" ) )
(setq 8th-keywords '("rsearch" "s:search" "search" "s:zt" "zt" "s:slice" "slice" "s:replace!" ) )
(setq 8th-keywords '("replace!" "s:replace" "replace" "s:lc" "lc" "s:fmt" "fmt" "s:-" "-" ) )
(setq 8th-keywords '("s:>ucs2" ">ucs2" "s:uc" "uc" "s:trim" "trim" "s:/" "/" "s:+" "+" "s:*" ) )
(setq 8th-keywords '("*" "s:fill" "fill" "s:clear" "clear" "s:cmp" "cmp" "s:cmpi" "cmpi" "s:=" ) )
(setq 8th-keywords '("=" "s:insert" "insert" "s:each" "each" "s:size" "size" "s:len" "len" ) )
(setq 8th-keywords '("s:base64>" "base64>" "s:!" "!" "s:@" "@" "s:lsub" "lsub" "s:map" "map" ) )
(setq 8th-keywords '("s:>base64" ">base64" "s:expand" "expand" "s:compress" "compress" "s:eachline" ) )
(setq 8th-keywords '("eachline" "s:rev" "rev" "s:strfmt" "strfmt" "s:/scripts" "/scripts" ) )
(setq 8th-keywords '("s:script?" "script?" "s:hexupr" "hexupr" "s:ltrim" "ltrim" "s:rtrim" ) )
(setq 8th-keywords '("rtrim" "s:globmatch" "globmatch" "s:<+" "<+" "s:utf8?" "utf8?" "s:ucs2>" ) )
(setq 8th-keywords '("ucs2>" "s:rsub" "rsub" "s:intl!" "intl!" "s:intl" "intl" "s:lang" "lang" ) )
(setq 8th-keywords '("st:size" "size" "st:slide" "slide" "st:shift" "shift" "st:+" "+" "st:." ) )
(setq 8th-keywords '("." "st:swap" "swap" "st:pick" "pick" "st:roll" "roll" "st:peek" "peek" ) )
(setq 8th-keywords '("st:clear" "clear" "st:pop" "pop" "st:push" "push" "st:len" "len" "st:new" ) )
(setq 8th-keywords '("new" "st:throwing" "throwing" "t:assign" "assign" "t:list" "list" "t:q-notify" ) )
(setq 8th-keywords '("q-notify" "t:q-wait" "q-wait" "t:wait" "wait" "t:task" "task" "t:!" ) )
(setq 8th-keywords '("!" "t:@" "@" "t:curtask" "curtask" "t:qlen" "qlen" "t:main" "main" "t:pop" ) )
(setq 8th-keywords '("pop" "t:push" "push" "t:name@" "name@" "t:getq" "getq" "t:def-queue" ) )
(setq 8th-keywords '("def-queue" "t:name!" "name!" "t:def-stack" "def-stack" "t:done?" "done?" ) )
(setq 8th-keywords '("t:result" "result" "t:task-n" "task-n" "t:task-stop" "task-stop" "t:notify" ) )
(setq 8th-keywords '("notify" "t:priority" "priority" "t:kill" "kill" "w:is" "is" "w:@" "@" ) )
(setq 8th-keywords '("w:cb" "cb" "w:deprecate" "deprecate" "w:alias:" "alias:" "w:undo" "undo" ) )
(setq 8th-keywords '("w:find" "find" "w:!" "!" "w:forget" "forget" "w:exec?" "exec?" "w:exec" ) )
(setq 8th-keywords '("exec" "xml:text!" "text!" "xml:>txt" ">txt" "xml:parent" "parent" "xml:each" ) )
(setq 8th-keywords '("each" "xml:text@" "text@" "xml:>s" ">s" "xml:@" "@" "xml:len" "len" ) )
(setq 8th-keywords '("xml:parse-html" "parse-html" "xml:parse" "parse" "xml:attrs" "attrs" ) )
(setq 8th-keywords '("xml:tag!" "tag!" "xml:attr@" "attr@" "xml:tag@" "tag@" "xml:attr!" "attr!" ) )
; postprocess and cleanup
(setq 8th-keywords-regexp (regexp-opt 8th-keywords 'words))
(setq 8th-keywords nil)
(setq 8th-font-lock-keywords
  `(
    (,8th-keywords-regexp . font-lock-keyword-face)
))
(provide '8th-mode)
