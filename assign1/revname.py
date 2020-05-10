#Write a Python program to reverse a word after accepting the input from the user.
word = input("enter a word to make it reverse:")
for i in range(len(word)-1, -1,-1):
# to display word in one line 
  print(word[i], end="")
