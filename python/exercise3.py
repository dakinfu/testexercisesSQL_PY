# Напишите функцию, которая принимает на вход список строк, состоящих из цифр,
# и возвращает максимальное возможное число,
# которое может получиться в результате конкатенации всех строк из этого списка.

from functools import cmp_to_key

strings = ['11', '234', '005', '87', '8']

def largest_number(strings):
    def compare(x, y):
        if x + y > y + x:
            return -1
        elif x + y < y + x:
            return 1
        else:
            return 0
        
    sorted_strings = sorted(strings, key=cmp_to_key(compare))
    return ''.join(sorted_strings)

print(largest_number(strings))

# Для решения задачи использовал:
# https://docs.python.org/3/library/functools.html
# https://stackoverflow.com/questions/32752739/how-does-the-functools-cmp-to-key-function-work
# https://docs.python.org/3/howto/sorting.html
# https://stackoverflow.com/questions/56179324/how-use-join-in-python (concatenation)