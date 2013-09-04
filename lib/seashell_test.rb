require './seashell.rb'

$console = Seashell.new

# Some basic messages and indentation.
$console.msg "Some sort of introductory message.  (1st level)"

# Throwing in a debug message to ensure we're not leaking.
$console.debug "You shouldn't see this."

$console.msg "Another small warning.  (1st level)"
$console.msg "Arbitrary list of things:  (1st level)"

$console.indent

$console.msg "Item number one.  (2nd level)"
$console.msg "Item number two.  (2nd level)"
$console.msg "Item number three, which is actually a sublist:  (2nd level)"

$console.indent

$console.msg "Item number one.  (3rd level)"
$console.msg "Item number two.  (3rd level)"

# Now let's test trying to unindent more time than we've indented.
$console.unindent
$console.unindent
$console.unindent
$console.unindent

# Now some actions.
$console.action "Restoring an imaginary file..."
$console.ok

$console.action "Increasing speed to 88MPH..."
$console.error

$console.action "Coming up with the next billion dollar idea..."
$console.failed

$console.action "Acheiving world peace..."
$console.done

# Now let's throw in some levels.
$console.debug = true

$console.msg "Just another regular old message.  (1st level)"
$console.msg "Maybe another message for good measure.  (1st level)"

$console.debug "Some cryptic debug output that may or may not help you.  (1st level)"

$console.action "Becoming the best developer ever..."
$console.done

$console.debug "Some more debug output!  (1st level)"

$console.msg "Now let's add some indentation in here.  (1st level)"

$console.indent

$console.msg "We're indented!  Woo!  (2nd level)"
$console.debug "Here's some indented debugging output!  (2nd level)"
$console.action "And an indented action which is working on something..."
$console.done
