;;; Model
; Names
(typedef "name" (uniont symbol string)) 
(typedef "variable name" "name") 
(typedef "function name"  "name") 
(typedef "function block type name" "name") 
(typedef "program name" "name") 
(typedef "configuration name"  "name") 
(typedef "task name" "name") 
(typedef "resource name" "name") 
(typedef "resource type name" "name")
(typedef "program configuration name" "name")
(typedef "state name" "name")
(typedef "process name" "name")

; Constants
(typedef "constant" (uniont "numeric literal" "time literal" "boolean literal" "binary integer" "octal integer" "hexadecimal integer")) 
(typedef "boolean literal" (enumt"TRUE" "FALSE")) 
(mot "integer literal" :at "type"  "integer type" :at "value" "int")  
(mot "real literal" :at "type" "real type" :at "value" real) 
(typedef "numeric literal" (uniont "integer literal" "real literal")) 
(mot "time literal" :at "sign" "sign type" :atv "d" real 0 :atv "h" real 0 :atv "m" real 0 :atv "s" real 0 :atv "ms" real 0) 
(typedef "sign type" (enumt "-")) 
(mot "binary integer" :at "value" int) 
(mot "octal integer" :at "value" int) 
(mot "hexadecimal integer" :at "value" int)

; Types
(typedef "type" (uniont "elementary type name" "array specification" "function block type name")) 
(typedef "elementary type name" (uniont "numeric type name" "bit string type name" "time type name" "string type name")) 
(typedef "numeric type name" (uniont "integer type name" "real type name")) 
(typedef "integer type name" (uniont "signed integer type name" "unsigned integer type name")) 
(typedef "signed integer type name" (enumt "SINT" "INT" "DINT" "LINT")) 
(typedef "unsigned integer type name" (enumt "USINT" "UINT" "UDINT" "ULINT")) 
(typedef "real type name" (enumt "REAL" "LREAL")) 
(typedef "bit string type name" (enumt "BOOL" "BYTE" "WORD" "DWORD" "LWORD")) 
(typedef "time type name" (enumt "TIME")) 
(typedef "string type name" (enumt "STRING" "WSTRING")) 
(mot "array specification" :at "interval" (uniont "array interval" "asterisk") :at "type" "elementary type name") 
(mot "array interval" :at "start" "integer expression" :at "end" "integer expression") 
(typedef "asterisk" (enumt "*"))

; Expressions
(mot ".[.]" :at "variable" "variable name" :at "index" "integer expression") 
(mot "OR" :at "arg1" "boolean expression" :at "arg2" "boolean expression") 
(mot "XOR" :at "arg1" "boolean expression"  :at "arg2" "boolean expression") 
(mot "AND" :at "arg1" "boolean expression" :at "arg2" "boolean expression") 
(mot "=" :at "arg1" "expression" :at "arg2" "expression") 
(mot "<>" :at "arg1" "expression" :at "arg2" "expression") 
(mot "<" :at "arg1" "expression" :at "arg2" "expression") 
(mot ">" :at "arg1" "expression" :at "arg2" "expression") 
(mot "<=" :at "arg1" "expression" :at "arg2" "expression") 
(mot ">=" :at "arg1" "expression" "arg2" "expression") 
(mot "+" :at "arg1" "numeric expression" :at "arg2" "numeric expression" :at "value" int) 
(mot "-" :at "arg1" "numeric expression" :at "arg2" "numeric expression" :av "value" int) 
(mot "*" :at "arg1" "numeric expression" :at "arg2" "numeric expression" :av "value" int) 
(mot "/" :at "arg1" "numeric expression" :at "arg2" "numeric expression" :av "value" int) 
(mot "MOD" :at "arg1" integer-expression :at "arg2" "integer-expression" :av "value" int ) 
(mot "**" :at "arg1" "numeric expression"  :at "arg2" "numeric expression") 
(mot "NOT" :at operand "boolean expression") 
(mot "-." :at operand "numeric expression" :at "value" int) 
(mot "process status expression" :at "process" "process name" :at "activity" "activity") 
(typedef "activity" (enumt "ACTIVE" "INACTIVE" "STOP" "ERROR")) 
(typedef "boolean expression" (uniont "boolean literal" "variable name" ".[.]" "process status expression" "function call" "OR" "XOR" "AND" "NOT" "=" "<>" "<" ">" "<=" ">=")) 
(typedef "integer expression" (uniont "integer literal" "variable name" ".[.]"  "function call" "+" "-" "-." "*" "/" "MOD"))  
(typedef "real expression" (uniont "real literal" "variable name" ".[.]" "function call" "+" "-" "-." "*" "/" "**")) 
(typedef "numeric expression" (uniont "integer expression" "real expression")) 
(typedef "other expression" (uniont "constant" "variable name", "function call")) 
(typedef "expression" (uniont "boolean expression" "numeric expression" "other expression"))  
(mot "function call" :at "function" "function name" :at "arguments" (listt "parameter assignment")) 
(mot "parameter assignment" :at "variable" "variable name" :at "assignment" "assignment type" :at "value" "expression") 
(typedef "assignment type" (enumt ":=" "=>"))

; Statements
;ST statements
(typedef "ST statement" (uniont "assignment statement" "selection statement" "iteration statement" "function block invocation" "exit statement" "return statement")) 
(typedef "assignment statement" (uniont "simple variable assignment" "array variable assignment")) 
(mot "simple variable assignment" :at "variable" "variable name" :at "value" "expression") 
(mot "array variable assignment" :at "variable" "variable name" :at "index" "integer expression" :at "value" "expression") 
(typedef "selection statement" (uniont "if statement" "case statement")) 
(mot "if statement" :at "if thens" (listt "if-then") :at "else" (listt "statement")) 
(mot "if then" :at "condition" "expression" :at "statements" (listt "statement")) 
(mot "case statement" :at "selector" "integer expression" :at "branches" (listt "case element") :at "else" (listt "statement")) 
(mot "case element" :at "cases" (listt "integer expression") :at "statements" (listt "statement")) 
(typedef "iteration statement" (uniont "for statement" "while statement" "repeat statement")) 
(mot "for statement" :at "control variable" "variable name" :at "from" "integer expression" :at "to" "integer expression" :atv "by" "integer expression" 1 :at "statements" (listt "statement")) 
(mot "while statement" :at "condition" "boolean expression" :at "statements" (listt "statement")) 
(mot "repeat statement" :at "condition" "boolean expression" :at "statements" (listt "statement")) 
(mot "function block invocation" :at "function-block" "variable name" :at "arguments" (listt "parameter assignment")) 
(typedef "return statement" (enumt "RETURN")) 
(typedef "exit statement" (enumt "EXIT"))
; poST statements
(typedef "statement" (uniont "ST statement" "process statement" "set state statement" "set next statement" "reset timer statement")) 
(typedef "process statement" (uniont "start process statement" "restart statement" "stop process statement" "stop statement" "error process statement" "error statement")) 
(mot "start process statement" :at "process" "process name") 
(typedef "restart statement" (enumt "RESTART")) 
(mot "stop process statement" :at "process" "process name") 
(typedef "stop statement" (enumt "STOP")) 
(mot "error process statement" :at "process" "process name") 
(typedef "error statement" (enumt "ERROR")) 
(mot "set state statement" :at "state" "state name") 
(typedef "set next statement" (enumt "SET NEXT")) 
(typedef "reset timer statement" (enumt "RESET TIMER")) 
(mot "timeout statement" :at "timeout" "expression" :at "statements" (listt "statement"))

; State and process declaration
(mot "state declaration" :at "name" "state name" :at "LOOPED" bool :at "body" (listt "statement") :at "timeout" "timeout statement")
(mot "process declaration" :at "name" "name" :at "input variables" (listt "input variable declarations") :at "output variables" (listt "output variable declarations") :at "input output variables" (listt "input output variable declarations") :at "variables" (listt "variable declarations") :at "temporary variables" (listt "temporary variable declarations")  :at "states" (listt "state declaration"))

; Program organization units
(mot "function declaration" :at "name" "function name" :at "return type" "elementary type name" :at "input variables" (listt "input variable declarations") 
  :at "output variables" "output variable declarations" :at "input output variables" "input output variable declarations" "variables" "variable declarations"
  :at "body" (listt "statement"))
(mot "function block declaration" :at "name" "function block type name" :at "input variables" (listt "input variable declarations")
 :at "output variables" (listt "output variable declarations") :at "input output variables" (listt "input output variable declarations")
 :at "variables" (listt "variable declarations") :at "temporary variables" (listt "temporary variable declarations")
 :at "external variables" (listt "external variable declarations") :at "body" (list "process declaration"))
(mot "program declaration" :at "name" "program name" :at "input variables" (listt "input variable declarations") :at "output variables" (listt "output variable declarations")
 :at "input output variables" (listt "input output variable declarations") :at "variables" (listt "variable declarations")
 :at "temporary variables" (listt "temporary variable declarations") :at "external variables" (listt "external variable declarations") :at "body" (list "process declaration"))

; Variable sections
(mot "input variable declarations" :at "variables" (listt "variable declaration")) 
(mot "output variable declarations" :at "variables" (listt "variable declaration")) 
(mot "input output variable declarations" :at "variabless" (listt "variable declaration")) 
(mot "variable declarations" :at "constant" "qualifier" :at "variables" (listt "variable declaration")) 
(mot "temporary variable declarations" :at "variables" (listt "variable declaration")) 
(mot "external variable declarations" :at "constant" "qualifier" :at "variables" (listt "variable declaration")) 
(mot "global variable declarations" :at "constant" "qualifier" :at "simple variables" (listt "variable declaration") :at "located variables" (listt "global variable declaration")) 
(typedef "qualifier" (enumt "CONSTANT"))

; Variabe declarations
(typedef "variable declaration" (uniont "simple variable declaration" "array variable declaration" "FB declaration")) 
(mot "simple variable declaration" :at "variable list" (listt "variable name" :at "type" "elementary type name" :at "value" "expression")) 
(mot "array variable declaration" :at "variable list" (listt "variable name") :at "type" "array specification" :at "values" (listt "expression")) 
(mot "FB declaration" :at "variable list" (listt "variable name") :at "type" "function block type name")

; Configuration elements
(mot "library" :at "configuration" "configuration declaration" :at "global variabless" (listt "global variable declarations") :at "programs" (listt "program declaration") :at "function blocks" (listt "function block declaration") :at "functions" (listt "function declaration")) 
(mot "configuration declaration" :at "name" "configuration name" :at "global variables" (listt "global variable declarations") :at "resources" (listt "resource declaration"))  
(mot "resource declaration" :at "name" "resource name" :at "type" "resource type name" :at "global variables" (listt "global variable declarations") :at "tasks" (listt "task") :at "program configurations" (listt "program configuration")) 
(mot "task" :at "name" "task name" :at "single" "variable name" :atv "interval" "time literal" (mo "time literal") :at "priority" nat)  
(mot "program configuration" :at "name" "program configuration name" :at "task" "task name" :at "program" "program name" :at "arguments" (listt "program configuration element")) 
(typedef "program configuration element" "parameter assignment") 
(mot "global variable declaration" :at "variable list" (listt "variable name") :at "AT" "direct variable" :at "type" "elementary type name")
(cot "direct variable" :at "location prefix" "location prefix" :at "size prefix" "size" :at "address" (list nat)) 
(typedef "location prefix" (enumt "I" "Q" "M")) 
(typedef "size" (enumt "X" "B" "W" "D" "L"))


; Model of semantic entities
(typedef "input output variable category" (enumt "VAR_INPUT" "VAR_IN_OUT" "VAR_OUTPUT")) 
(typedef "poST value" (uniont "boolean literal" nat int float "array" "function block snapshot")) 
(typedef "array" (listt "poST value")) 
(mot "location" :at "value" "poST value") 

(mot "function information"
:at "variable type" (cot :amap "variable name" "type")
:at "variable input output category" (cot :amap "variable name" "input output category")
:at "declaration" "function declaration") 

(mot "function block information"
:at "variable type" (cot :amap "variable name" "type")
:at "variable input output category" (cot :amap "variable name" "input output category")
:at "declaration" "function block declaration"
:at "processes" (cot :amap "process name" "process information")) 

(mot "program information"
:at "variable type" (cot :amap "variable name" "type")
:at "variable input output category" (cot :amap "variable name" "input output category")
:at "declaration" "program declaration"
:at "processes" (cot :amap "process name" "process information")) 

(mot "function snapshot"
:at "variable location" (cot :amap "variable name" "location")
:at "function information" "function information") 

(mot "function block snapshot"
:at "variable location" (cot :amap "variable name" "location") ; variable values
:at "processes" (cot :amap "process name" "process snapshot") ; list of process instances
:at "current process" "process snapshot" ; current process
:at "type information" "function block information" ; information about the function block type
:at "gtime" nat ) 

(mot "program snapshot"
:at "variable location" (cot :amap "variable name" "location") ; variable values
:at "processes" (cot :amap "process name" "process snapshot") ; list of process instances
:at "current process" "process snapshot" ; current process
:at "type information" "program information information" ; information about the function block type
:at "gtime" nat) 

(mot "process information"
:at "variable type" (cot :amap "variable name" "type")
:at "state number" (cot :amap "state name" int)
:at "declaration" "process declaration") 

(mot "process snapshot"
:at "variable location" (cot :amap "variable name" "location")
:at "process information" "process information"
:at "current state" int
:at "timer" nat)

(typedef "POU instance" (uniont "function snapshot" "function block snapshot" "program snapshot")) 

(mot "plant" :at "input variables" (cot :amap "variable name" "type")) 

(cot "queue position"
:at "priority" nat
:at "scheduling time" real)

(mot "program in queue"
:at "program" "program configuration"
:at "deadline" nat)
;;; Operational semantics

; Agent and environment
(mot "env")
(mot "agent"
:at "variable type" (cot :amap "variable name" "type")
:at "variable location" (cot :amap "name" "location")
:at "direct variable type" (cot :amap "direct variable" "type")
:at "direct variable location" (cot :amap "direct variable" "location")
:at "function information" (cot :amap "function name" "function information")
:at "function block information" (cot :amap "function block type name" "function block information")
:at "program information" (cot :amap "program name" "program information")
:at "plant" "plant"
:at "gtime" nat
:at "program state" (cot :amap "program configuration name" "program snapshot")
:at "process initialization" bool
:at "distribution of programs by tasks" (cot :amap "task name" (listt "program configuration"))
:at "last scheduling time" (cot :amap "task name" real)
:at "current POU instance" "POU instance"
:at "queue" (cot :amap "queue position" (listt "program in queue"))
:at "deadline" nat
:av "START" 0
:av "STOP" -2
:av "ERROR" -1)

;;; Operational semantics
; ST statements
; Assignment statements
; simple variable assignment

(aspect "opsem" :context ac :type "simple variable assignment" :instance i :ap i "value" val :do
(update-push-acontext ac :stage "assign")
(clear-update-eval-acontext ac :instance val))


(aspect "opsem" :context ac :type "simple variable assignment" :instance i :stage "assign" :agent a :value val :ap i "variable" var :p (get-variable-location var a) l :do
(aset l "value" (iclone val)))

; array variable assignment

(aspect "opsem" :context ac :type "array variable assignment" :instance i :ap i "index" j :do
(update-push-acontext ac :stage "value")
(clear-update-push-acontext :instance j))


(aspect "opsem" :context ac :type "array variable assignment" :instance i :stage "value" :value j :ap i "value" val :do
(update-push-acontext ac :stage "assign" :av "index" j)
(clear-update-eval-acontext ac :instance val))


(aspect "opsem" :context ac :type "array variable assignment" :instance i :stage "assign" :value val :agent a :ap i "array" var :ap ac "index" j :p (get-variable-location var a) l :p (get-variable-type var a) t :ap t "interval" bounds :ap bounds (aseq "start" "value") s :ap bounds (aseq "end" "value") e :match
:v (and (<= s j) (<= j e)) T
:do (aset l "value" (- j s) val)
:exit (error ac "incorrect index"))

; Selection statements
; IF

(aspect "opsem" :context ac :type "if statement" :instance i :ap i "if thens" if-thens :p (nth 0 if-thens) if-then :do
(update-push-acontext ac :stage "checking condition" :av "current" 0 :av "length" (length if-thens) :av "statements" (aget if-then "statements"))
(clear-update-eval-acontext ac :instance (aget if-then "condition")))


(aspect "opsem" :context ac :type "if statement" :instance i :stage "checking condition" :value cond :ap ac "current" j :ap ac "length" n :ap ac "statements" sts :nmatch
:v cond "TRUE"
:exit (update-push-acontext ac :stage "statement execution" :av "current" 0 :av "length" (length sts))
:v (< (+ j 1) n) T
:exit (match :ap i (aseq "if thens" (+ j 1)) if-then :do
(update-push-acontext ac :stage "checking condition" :av "current" (+ j 1) :av "statements" (aget if-then "statements"))
(clear-update-eval-acontext ac :instance (aget if-then "condition")))
:do (match :ap i "else" else :do
(update-push-acontext ac :stage "statement execution" :av "statements" else :av "current" 0 :av "length" (length else))))


(aspect "opsem" :context ac :type "if statement" :instance i :stage "statement execution" :ap ac "statements" sts :ap "current" j :ap ac "length" n :match
:v (< j n) T :do
(update-push-acontext ac :av "current" (+ j 1))
(clear-update-eval-acontext ac :instance (nth j sts)))

; CASE

(aspect "opsem::case" :context ac :type "integer expression" :instance i :do
(update-push-acontext ac :stage "matched")
(clear-update-push-acontext ac :attribute "opsem" :instance i))


(aspect "opsem::case" :context ac :type "integer expression" :instance i :stage "matched" :value v :ap ac "selector" s :do
(= s v))


(aspect "opsem" :context ac :type "case statement" :instance i :ap i "selector" s :do
(update-push-acontext ac :stage "selector")
(clear-update-eval-acontext ac :instance s))


(aspect "opsem" :context ac :type "case statement" :instance i :stage "selector" :value s :ap i "branches" branches :do
(update-push-acontext ac :stage "branches iteration" :av "current branch" 0 :av "number of branches" (length branches) :av "selector" s))


(aspect "opsem" :context ac :type "case statement" :instance i :stage "branches iteration" :ap i "branches" branches :ap ac "current branch" j :ap ac "number of branches" n :match
:v (< j n) T
:do (match :p (nth j branches) b :ap b "cases" cases :do
(update-push-acontext ac :stage "case list evaluation" :av "branch" b :av "current case" 0 :av "number of cases" (length cases) :av "matched" nil)
(clear-update-eval-acontext ac :attribute "opsem::case" :instance (nth 0 cases)))
:exit (match :ap i "else" else :do
(update-push-acontext ac :stage "statement execution" :av "statements" else :av "current" 0 :av "length" (length else)))


(aspect "opsem" :context ac :type "case statement" :instance i :stage "case list evaluation" :value case :ap ac "branch" b :ap ac "current case" k :ap "number of cases" m :ap ac "matched" matched :p (or matched case) new-matched :nmatch
:v new-matched T
:exit (match :ap b "statements" sts :do
(update-push-acontext ac :stage "statement execution" :av "statements" sts :av "current" 0 :av "length" (length sts)))
:v (< (+ k 1) m) T :do
:exit 
(update-push-acontext ac :av "current case" (+ k 1) :av "matched" new-matched)
(clear-update-eval-acontext ac :attribute "opsem::case" :instance (aget b "cases" (+ k 1)))
:do (match :ap ac "current branch" j :do
(update-push-acontext ac :stage "branches iteration" :av "current branch" (+ j 1))))


(aspect "opsem" :context ac :type "case statement" :instance i :stage "statement execution" :ap ac "statements" sts :ap ac "current" j :ap ac "length" n :do
(update-push-acontext ac :av "current" (+ j 1))
(clear-update-push-acontext ac :instance (nth j sts)))

; Iteration statements
; FOR

(aspect "opsem" :context ac :type "for statement" :instance i :ap i "control variable" j :ap i "from" from :do
(update-push-acontext ac :stage "to")
(clear-update-eval-acontext ac :instance (mo "simple variable assignment" :av "variable" j :av "value" from)))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "to" :ap i "to" to :do
(update-push-acontext ac :stage "by")
(clear-update-eval-acontext ac :instance to))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "by" :value to :ap i "by" by :do
(update-push-acontext ac :stage "control variable" :av "to" to)
(clear-update-push-acontext ac :instance by))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "control variable" :value by :ap i "control variable" j :do
(update-push-acontext ac :stage "loop condition" :av "by" by)
(clear-update-eval-acontext ac :instance j))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "loop condition" :value j :ap ac "to" to :ap ac "by" by :ap i "statements" sts :nmatch
:v (= by 0) :exit (error ac "zero step of FOR loop")
:v (or (and (> by 0) (<= j to)) (and (< by 0) (>= j to)))
:exit (update-push-acontext ac :stage "statement execution" :av "current" 0 :av "length" (length sts))
:do (update-push-acontext ac :stage "end loop"))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "statement execution" :ap i "statements" sts :ap ac "current" j :ap ac "length" n :match
:v (< j n) :do
(update-push-acontext ac :av "current" (+ j 1))
(clear-update-push-acontext ac :instance (nth j sts))
:exit (update-push-acontext ac :stage "increment control variable"))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "increment control variable" :ap i "control variable" j :ap ac "by" by :do
(update-push-acontext ac :stage "control variable")
(clear-update-push-acontext ac :instance (mo "simple variable assignment" :av "variable" j :av "value" (mo "+" :av "arg1" j :av "arg2" by))))


(aspect "opsem" :context ac :type "for statement" :instance i :stage "end loop" :agent a :ap i "control variable" j :p (get-variable-type j a) t :p (random-value t) v :do
(clear-update-eval-acontext ac :instance (mo "simple variable assignment" :av "variable" j :av "value" v)))

; WHILE

(aspect "opsem" :context ac :type "while statement" :instance i :ap i "condition" cond :do
(update-push-acontext ac :stage "checking condition")
(clear-update-eval-acontext ac :instance cond))


(aspect "opsem" :context ac :type "while statement" :instance i :stage "checking condition" :value cond :ap i "statements" sts :match
:v cond "TRUE" :do
(update-push-acontext ac :stage "statement execution" :av "current" 0 :av "length" (length sts)))


(aspect "opsem" :context ac :type "while statement" :instance i :stage "statement execution" :ap i "statements" sts :ap ac "current" j :ap ac "length" n :match
:v (< j n) T :do
(update-push-acontext ac :av "current" (+ j 1))
(clear-update-eval-acontext ac :instance (nth j sts))
:exit (update-push-acontext ac :stage nil))

; REPEAT

(aspect "opsem" :context ac :type "repeat statement" :instance i :ap i "statements" sts :do
(update-push-acontext ac :stage "statement execution" :av "current" 0 :av "length" (length sts)))


(aspect "opsem" :context ac :type "repeat statement" :instance i :stage "checking condition" :value cond :ap i "statements" sts :match
:v cond "FALSE" :do
(update-push-acontext ac :stage "statement execution" :av "current" 0 :av "length" (length sts)))


(aspect "opsem" :context ac :type "repeat statement" :instance i :stage "statement execution" :ap i "statements" sts :ap ac "current" j :ap ac "length" n :ap i "condition" cond :match
:v (< j n) T :do
(update-push-acontext ac :av "current" (+ j 1))
(clear-update-eval-acontext ac :instance (nth j sts))
:exit 
(update-push-acontext ac :stage "checking condition")
(clear-update-eval-acontext ac :instance cond))

; EXIT

(aspect "opsem" :context ac :type "exit statement" :instance i :p (pop-acontext ac) ac1 :match
:v (is-instance (aget ac1 "instance") "iteration statement") nil :do
(eval-acontext ac))

; RETURN

(aspect "opsem" :context ac :type "return statement" :instance i :p (pop-acontext ac) ac1 :match
:v (is-instance (aget ac1 "instance") "POU") nil :do
(eval-acontext ac))

; Function block invocation

(aspect "opsem" :context ac :type "function block invocation" :instance i :agent a :ap i "function block" fb-name :do
(update-push-acontext ac :stage "function block instance")
(clear-update-eval-acontext ac :instance fb-name))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "function block instance" :agent a :value fb :ap i "arguments" args :do
(update-push-acontext ac :stage "starting argument avaluation" :av "current" 0 :av "length" (length args) :av "fb instance" fb :av "argument values" (mo :av "VAR_INPUT" (mo) :av "VAR_IN_OUT" (mo))))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "starting argument evaluation" :agent a :ap i "arguments" args :ap ac "current" j :ap ac "length" n :ap ac "fb instance" fb :ap fb "type information" fb-info :match
:v (< j n) T :do
(match :ap args j arg :ap arg "variable" var :ap arg "value" val :ap fb-info (aseq "variable input output category" var) io-category :do
(update-push-acontext ac :stage "argument evaluation" :av "variable" var :av "io category" io-category)
(nmatch
:v (equiv io-category "VAR_INPUT")
:exit (clear-update-eval-acontext ac :instance val)
:v (equal io-category "VAR_IN_OUT")
::exit (get-variable-location val a)
:do nil))
:exit (update-push-acontext :stage "function block call"))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "argument evaluation" :value val :ap ac "variable" var :ap ac "current" j :ap ac "io category" io-category :ap ac "argument values" avs :do
(update-push-acontext ac :stage "starting argument evaluation" :av "current" (+ j 1))
(match :v (not (equal io-category "VAR_OUTPUT")) T :do
(aset avs io-category var val)))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "function block call" :agent a :ap a "current POU instance" calling-inst :ap ac "fb instance" fb :ap ac (aseq "argument values" "VAR_INPUT") iavs :p (attributes iavs) p-names :do
(update-push-acontext ac :stage "input argument assignment" :av "input argument values" iavs :av "parameter names" p-names :av "current" 0 :av "length" (length p-names) :av "calling POU instance" calling-inst)
(aset a "current POU instance" fb))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "input argument assignment" :agent a :ap a "current POU instance" fb :ap ac "input argument values" iavs :ap ac "parameter names" p-names :ap ac "current" j :ap ac "length" n :match
:v (< j n) T :do
(match :p (nth j p-names) p :ap iavs p v :do
(update-push-acontext ac :av "current" (+ j 1))
(aset f-state "variable location" p "value" (iclone v)))
:exit (match :ap ac (aseq "argument values" "VAR_IN_OUT") ioavs :p (attributes ioavs) p-names :do
(update-push-acontext ac :stage "input output variable assignment" :av "input output argument values" ioavs :av "parameter names" p-names :av "cuurent" 0 :av "length" (length p-names))))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "input output argument assignment" :agent a :ap a "current POU instance" fb :ap ac "input output argument values" ioavs :ap ac "parameter names" p-names :ap ac "current" j :ap ac "length" n :match
:v (< j n) T :do
(match :p (nth j p-names) p :ap iavs p v :do
(update-push-acontext ac :av "current" (+ j 1))
(aset f-state "variable location" p v))
:exit
(update-push-acontext ac :stage "execution"))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "execution" :ap ac "fb instance" fb :ap fb "type information" fb-info :ap fb-info "declaration" fb-decl :do
(update-push-acontext ac :stage "return")
(clear-update-eval-acontext ac :instance fb-decl))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "return" :agent a :ap ac "calling POU instance" calling-inst :ap i "arguments" args :do
(update-push-acontext ac :stage "output" :av "cuurent" 0 :av "length" (length args))
(aset a "current POU instance" calling-inst))


(aspect "opsem" :context ac :type "function block invocation" :instance i :stage "output" :agent a :ap i "arguments" args :ap ac "current" j :ap ac "length" n :ap ac "fb instance" fb :match
:v (< j n) T :do
(update-push-acontext ac :av "current" (+ j 1))
(match :ap args j arg :av arg "assignment" "=>" :do
(match :ap arg "variable" var :ap arg "value" output :ap fb (aseq "variable location" var "value") val :do
(clear-update-eval-acontext ac :attribute "opsem::assignment" :instance output :av "value" (iclone val)))))

; Process statements
; START PROCESS

(aspect "opsem" :context ac :type "start process statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" cp :ap i "process" p-name :ap current-inst (aseq "processes" p-name) p :ap p (aseq "process information" "declaration") p-decl :ap a "START" START :do
(update-push-acontext ac :stage "process initialized" :av "current process" cp)
(aset p "current state" START)
(aset p "timer" (aget current-inst "gtime"))
(aset a "process initialization" T)
(aset current-inst "current process" p)
(clear-update-push-acontext ac :attribute "opsem::init" :instance p-decl))


(aspect "opsem" :context ac :type "start process statement" :instance i :stage "process initialized" :agent a :ap a "current POU instance" current-inst :ap ac "current process" cp :do
(aset a "process initialization" nil)
(aset current-inst "current process" cp))

; RESTART

(aspect "opsem" :context ac :type "restart statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :ap p (aseq "process information" "declaration") p-decl :ap a "START" START :do
(update-push-acontext ac :stage "process initialized" :av "current process" p)
(aset p "current state" START)
(aset p "timer" (aget current-inst "gtime"))
(aset a "process initialization" T)
(clear-update-push-acontext ac :attribute "opsem::init" :instance p-decl))


(aspect "opsem" :context ac :type "restart statement" :instance i :stage "process initialized" :agent a :ap a "current POU instance" current-inst :do
(aset a "process initialization" nil))


; STOP PROCESS

(aspect "opsem" :context ac :type "stop process statement" :instance i :agent a :ap a "current POU instance" current-inst :ap i "process" p-name :ap current-inst (aseq "processes" p-name) p :ap a "STOP" STOP :do
(aset p "current state" STOP))

; STOP

(aspect "opsem" :context ac :type "stop statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :ap a "STOP" STOP :do
(aset p "current state" STOP))

; ERROR PROCESS

(aspect "opsem" :context ac :type "error process statement" :instance i :agent a :ap a "current POU instance" current-inst :ap i "process" p-name :ap current-inst (aseq "processes" p-name) p :ap a "ERROR" ERROR :do
(aset p "current state" ERROR))

; ERROR

(aspect "opsem" :context ac :type "error statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :ap a "ERROR" ERROR :do
(aset p "current state" ERROR))

; Set state statements

(aspect "opsem" :context ac :type "set state statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :ap i "state" s :ap p (aseq "state number" s) sn :do
(aset p "current state" sn)
(aset p "timer" (aget current-inst "gtime")))


(aspect "opsem" :context ac :type "set next statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :ap p "current state" s :do
(aset p "current state" (+ s 1))
(aset p "timer" (aget current-inst "gtime")))

; Reset timer statement

(aspect "opsem" :context ac :type "reset timer statement" :instance i :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :do
(aset p "timer" (aget current-inst "gtime")))

; Timeout statement

(aspect "opsem" :context ac :type "timeout statement" :instance i :ap i "timeout" t :do
(update-push-acontext ac :stage "timeout condition")
(clear-update-eval-acontext ac :instance t))


(aspect "opsem" :context ac :type "timeout statement" :instance i :stage "timeout condition" :value t :agent a :ap a "current POU instance" current-inst :ap current-inst "current process" p :ap current-inst "gtime" gtime :ap p "timer" timer :ap i "statements" sts :match
:v (>= (- gtime timer) t) :do
(update-push-acontext ac :stage "statement execution" :av "current" 0 :av "length" (length sts)))


(aspect "opsem" :context ac :type "timeout statement" :instance i :ap i "statements" sts :stage "statement execution" :ap ac "current" j :ap ac "length" n :match
:v (< j n) T :do
(update-push-acontext ac :av "current" (+ j 1))
(clear-update-acontext ac :instance (nth j sts)))
