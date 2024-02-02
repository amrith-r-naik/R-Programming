# Logical : Like Boolean
v <- TRUE
print(class(v)) # class() gives the data type of the argument

# Numeric : normal numbers including floats
v <- 12.3
print(class(v))

# Integer : should end with L
v <- 2L
print(class(v))

# Complex
v <- 2+5i
print(class(v))

# Character : single characters as well as string
v <- "yo"
print(class(v))

# Raw : "Hello" is stored as 48 65 6c 6c 6f
v <- charToRaw("Hello")
print(class(v))