% Conditional G-code

# Overview

Conditional G-code is a powerful feature of Slic3r that allows for arbitrary
math to be done in Custom G-code fields as well as setting conditions for specific statements to appear in output from Custom G-code.

# Conditional expressions

Conditional expressions has the following syntax:

* `{if _expression_}`

_expression_ may take one of the following forms: 

* _VARIABLE_ _OPERATOR_ _CONSTANT_
* _CONSTANT_ _OPERATOR_ _VARIABLE_
* `{_subexpression_}` _OPERATOR_ `{_subexpression_}`
* _OPERATOR_ `_subexpression_`

_subexpression_ has the same forms as _expression_.

If _subexpression_s exist, they are evaluated before any other operators.

Available operators:

* `&&` or `and`: logical AND
* `||` or `or`: logical OR
* `!` or `not`: logical NOT (inversion)
* `^` or `xor`: XOR (exclusive-OR)
* `==` or `equals`: equality comparison
* `!=`: inequality comparison. To use words, use a subexpression.
* `<`: less than (valid for numbers only)
* `<=`: less than or equal to (valid for numbers only)
* `>`: greater than (valid for numbers only)
* `>=`: greater than or equal to (valid for numbers only)
* Anything supported by [exprtk](http://www.partow.net/programming/exprtk/index.html) (except for generic variables, file I/O and expressions that involve `{}`)

The `true` and `false` keywords are available.

To apply a single condition to multiple lines, repeat it once for each line:

````
{if [layer_num] == 10}M104 S210
{if [layer_num] == 10}M600
````

If a conditional expression evaluates to false, all the characters until the end of the line are removed.
If a conditional expression fails to parse, it's silently left untouched.

Expressions may be chained for an implicit AND:

````
{if [layer_num] == 10}{if [temperature_1] != 210}M104 S210
````

## Conventions

* Numerical value of 0 is equivalent to logical `false`. Any nonzero value is considered to be logical `true`.
    * `{if { 1 - 1 } }` would result in 0 and thus `false`.

# Value expressions (G-code Math)

Any expression enclosed in two curly brackets, but not starting with `{if` is evaluated as an arithmetic expression: `{foo - bar}`.
If evaluation fails, the expression is silently left untouched.
If any float variables are used, return value will have decimals. If string variables are mixed with numeric variables, they are parsed as floats if they have a dot, or integers otherwise.

Value expressions can be used in conditional expressions by nesting them: `{if {foo - bar} > 10}`.

* All operators supported for conditional expressions are supported for value expressions.


# Restrictions

* Every expression in `{}` must resolve to a number.
* Nested sub-expressions are evaluated before the current expression is evaluated.
* Value Expressions and Conditional G-code are evaluated before any post-processing scripts.

# Troubleshooting

* If the parser can't understand your statements, it will output nothing for that block.
* Remember that Custom G-code placeholders (items in `[]`) are resolved before Conditional G-code.
* Some Custom G-code placeholders have a floating point value, and the equality comparison will likely not work on these. For example `{if [layer_z] == 10}` will never return true. It is however possible to work around this, es: `{if [layer_z] > 9.999}{if [layer_z] < 10.001}` or `{if abs([layer_z]-10) < 0.001}`.
