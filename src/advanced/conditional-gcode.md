% Conditional G-code

# Overview

Conditional G-code is a powerful feature of Slic3r that allows for arbitrary
math to be done in Custom G-code fields as well as setting conditions for
specific statements to appear in output from Custom G-code.

# Conditional expressions

Conditional expressions has the following syntax:

* `{if _expression_}`

_expression_ may take one of the following forms: 

* _VARIABLE_ _OPERATOR_ _CONSTANT_
* _CONSTANT_ _OPERATOR_ _VARIABLE_
* `{_subexpression_}` _OPERATOR_ `{_subexpression_}`
* _OPERATOR_ `_subexpression_`

_subexpression_ has the same forms as _expression_.

If *subexpression*s exist, they are evaluated before any other operators.

Available operators:

* `&&` or `and` &ndash; logical AND
* `||` or `or` &ndash; logical OR
* `!` or `not` &ndash; logical NOT (inversion)
* `^` or `xor` &ndash; XOR (exclusive-OR)
* `==` or `equals` &ndash; equality comparison
* `!=` &ndash; inequality comparison. To use words, use a subexpression.
* `<` &ndash; less than (valid for numbers only)
* `<=` &ndash; less than or equal to (valid for numbers only)
* `>` &ndash; greater than (valid for numbers only)
* `>=` &ndash; greater than or equal to (valid for numbers only)
* Anything supported by
  [exprtk](http://www.partow.net/programming/exprtk/index.html)
  (except for generic variables, file I/O and expressions that involve `{}`)

The `true` and `false` keywords are available.

To apply a single condition to multiple lines, repeat it once for each line:

````
{if [layer_num] == 10}M104 S210
{if [layer_num] == 10}M600
````

If a conditional expression evaluates to false, all the characters until the end
of the line are removed. If a conditional expression fails to parse, it's
silently left untouched.

Expressions may be chained for an implicit AND:

````
{if [layer_num] == 10}{if [temperature_1] != 210}M104 S210
````

## Conventions

* Numerical value of 0 is equivalent to logical `false`. Any nonzero value is
  considered to be logical `true`.
    * `{if { 1 - 1 } }` would result in 0 and thus `false`.

# Value expressions (G-code Math)

Any expression enclosed in two curly brackets, but not starting with `{if`,
is evaluated as an arithmetic expression: `{foo - bar}`. If evaluation fails,
the expression is silently left untouched. If any float variables are used,
return value will have decimals. If string variables are mixed with numeric
variables, they are parsed as floats if they have a dot, or integers otherwise.

Value expressions can be used in conditional expressions by nesting them:
`{if {foo - bar} > 10}`.

* All operators supported for conditional expressions are supported for value
  expressions.


# Restrictions

* Every expression in `{}` must resolve to a number.
* Nested sub-expressions are evaluated before the current expression is
  evaluated.
* Value Expressions and Conditional G-code are evaluated before any
  post-processing scripts.

# Troubleshooting

* If the parser can't understand your statements, it will output nothing for
  that block.
* Remember that Custom G-code placeholders (items in `[]`) are resolved before
  Conditional G-code.
