# julia1_3.2.jl Functions and Math Library
#
# A function is a block of code callable with
#    zero or more params that will return a result

# two ways to define a functions (already defined)
function mul_add(x,y,z)
    return x*y+z   # no return necessary but recommended
end  # value of final expression returned if no return
# or as a one liner:
mul_add(x,y,z)=x*y+z  # if x and y matrices then uses
#  regular dot product row by column matrix mult.
println(mul_add(10.0,22.22,7.8))

# Hadamard - element by corresponding element matrix
#   product below
muladde(x,y,z)=x.*y+z # .* -> Xij*Yij ∀ i,j
x=[1 2; 3 4]
y=[1 2; 3 4]
z=100
mul_add(x,y,z)
muladde(x,y,z)
z=[10 20; 30 40]
muladde(x,y,z)
#
# returning multiple results as n-tuple
m3(a,b,c,m)=(a*m,b*m,c*m)
a=4.2
b=[1 2; 3 4]
c=13.1+2im
m=3
(x,y,z)=m3(a,b,c,m)
println("x=$x\n y=$y\n z=$z")
# Repeat with:
m=3//2
m=π+e*1im
m=[1 2; 3 4]

# functions narrow parameter types
function ∑(x) # yes, function names can use UTF-8 chars
    s=0
    for i=1:endof(x)
        s+=x[i]
    end
    return s
end
x=1:100
println(∑(x))
x=[1.0 2; 3 4]
println(∑(x))
# the base function sum() does nearly the same thing so
# could have written ∑=sum
function formletter(name,letter)
    "Dear $name\n \n"*letter*
    "\nYour friendly local utility."
end
letter1="    We wish to inform you that a meteor
shower is due Tuesday at 8:00 PM so please
look for cover.\n"

print(formletter("Mr. Patel",letter1))

# Operators are functions
println(+(1,2,3,π,e)) #
⊻(true,true) # xor(true,true) ⊻ =Char(0x22bb)

# map maps a function to each element of an array
v=map(round,[1.5,3.3,2.7])

# MATH LIBRARY
# (these can take vectors and matrices
#   and operations are elementwise)
# abs abs2 angle cbrt
# airy airyai airyaiprime airybi airybiprime airyprime
# acos acosh asin asinh atan atan2 atanh
# acsc acsch asec asech acot acoth
# cos  cospi cosh  sin  sinpi sinh  tan  tanh  sinc  cosc
# csc  csch  sec  sech  cot  coth
# acosd asind atand asecd acscd acotd
# cosd  sind  tand  secd  cscd  cotd
# besselh besseli besselj besselj0 besselj1 besselk bessely bessely0 bessely1
# exp  erf  erfc  erfinv erfcinv exp2  expm1
# beta dawson digamma erfcx erfi
# exponent eta zeta gamma
# hankelh1 hankelh2
# ceil  floor  round  trunc
# isfinite isinf isnan
# lbeta lfact lgamma
# log log10 log1p log2
# sqrt hypot

# string library
parse(T,s,base=10) # interprets string as numbers
# base defaults to 10 if not specified
# T is specified type
# s is string to be be parsed
# This is the basic string->number conversion routine.
st="12.34"
x=(parse(Float64,st))

# Plotting: both Gadfly and DataFrames comes
#  with the JuliaPro package
using Gadfly   # plotter frontend
using DataFrames
df=DataFrame(primes=[2, 3, 5, 7, 11, 13, 17, 19, 23, 29],
 febn=[1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
plot(df, x=:primes, y=:febn, Geom.point, Geom.line)

# System Library
println(Sys.CPU_CORES)
println(Sys.WORD_SIZE)
println(Sys.MACHINE)
# and many others

# Base math library
base(base,n,pad) # convert an integer n to string
#    length pad, in base, leading zeros
println(base(5,16,4)) # base 5, int 16, pad to 4 digits
println(bits(255))    # converts to a binary string
#
