RUN="pryi ../aaa.pri"

$RUN -command Test_Real 2> errors > output

cat output
grep "Error:" errors

rm errors
rm output

