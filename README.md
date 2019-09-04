# Welcome to the Modak Reverse Polish Notation calculator

To run this program on a local machine, git clone https://github.com/markevan100/RPN-calculator-Modak.git,
navigate to the folder and type `ruby modak_rpn.rb`. If you are unfamiliar with RPN, it is a
mathematic notation in which operators follow rather than precede their operands. This means,
you can input two numbers and then decide what to do with them.

This calculator can gracefully solve equations with +, -, \*, /, and \*\* (which will
raise the first number to the power of the second number.) The calculator stores your input
numbers in an array, so there is virtually no limit to the quantity of numbers you can
compute. When you perform an operation on two operands, the resulting value will be
stored for your further use and enjoyment.

This calculator handles decimal numbers (floats) as both input and output but
please note that output decimals will be rounded to two digits to provide a simplified
user experience.

You may NOT input a zero. However, you can get back to a zero value at any time
by inputing =. The only likely situation in which a user would want to input a 0 would
be to multiply by zero or to divide 0 by something, which would effective reset the
current value to 0. The = operator in this calculator will achieve the same result.

## Parts of the code that are exemplary:

I am not sure a dev ever thinks that their own code is 'exemplary' because there is
is _always_ room to improve and grow. That being said, I am happy that my code is
well explained and divided into different sections so that it should be easy for
another dev to come in and know exactly what is going on. This is due to both how
the different parts are divided out as well as how things are named/labeled. I also
think that invalid input is handled gracefully with instructions for the user on how
to continue or what might have gone wrong. For example, the program will distinguish
between prompting a user to input *either* an operand or an operator or *only* an operand
based on the situation.

I also added an extra layer of customization for the user by allowing them to select the
number of decimal places they would like to have in results. If the user inputs an invalid
value for the decimal places, it will simply eliminate the decimal.

## Parts of the code that I would like to improve:

There are currently 5 different `if` statements (two of which are nested), and numerous `elsif`s
to accompany them. The first thing that I would want to accomplish to DRY up this code
and make it more maintainable would would be to reduce the number of `if` statements. There
is also a nested case statement... but at least it is not another if! In some cases,
the `if` statements are just to make sure that the appropriate error message is served
to the user, so that seems harder to avoid, but some of the ifs in the internal
logic might not be the best option available.

I would say that the most challenging area for me was taking the operators which
are passed in as strings from the user and using them in equations. The solution that
I came up with was to save them in an array, match them with the user's input, pass down
the number of the index, and then use a case statement with that number to perform
the desired equation. There would be *massive* gains if I found an easier way to
approach that piece of the logic.

## Explanations of important decisions I made:

1) How to deal with incoming equation symbols (see above)
2) How to serve error messages (see above)
3) How to deal with floats.

    I decided to include floats to give more precision to the user experience,
    although sticking to integers may have been more straightforward. The main
    concern with floats is rounding, so I allowed users to dictate the level of
    rounding with which they are comfortable.

4) Instructions to give at the beginning

    Although the example in the assignment does not give instructions, I wanted
    to help the user have a smooth experience with my program.

5) Input of zero

    There seemed to be few reasons to allow a user to input a zero, and they were
    easily covered by allowing the user to reset the current value at any time
    (with the = operator). This is why I decided to use 0 to check for invalid
    input and not allow it as valid user input.

6) Edge cases

    One specific edge case that exists is that a user can input a number followed
    by any characters they want. Ruby will reduce to just the number. For
    example, an input of `15aljdljhoiuoiu3984074knklf--)93` would be interpreted as 15.
    However, to be more explicit with my users, I have disabled this by also sending
    the input through a regex validation check. To more gracefully handle these cases,
    my program will make a recommendation based on the number that they think
    the user might have been trying to enter. The user can still get around this by
    including a second decimal point. However, this will not break the program, the
    program will just consider that second decimal point to be the end of the input
    number (much like a period ends a sentence) and it will consider the characters
    before the second decimal point when evaluating the number.
