# The locale specified by the environment affects sort order.
export Set LC_ALL=C
COMPILE="../../support/compile.sh"
 
$COMPILE stack_simp2.psl
(./psl.exe 2>&1) > output

# Filter output without errors (last line containing "Pop = 1"
cat output |
  awk '   BEGIN   {output=1}
       output==0   {next}
       /Pop = 1/  {output=0}
                  {print}'

# Filter errors
cat output |
  grep "Error"
