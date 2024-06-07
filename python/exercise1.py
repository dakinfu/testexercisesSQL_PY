# Особенный номер – строка формата [2-4 цифры]\[2-5 цифр]. 
# Хороший номер - строка формата [4 цифры]\[5 цифр]. 
# Хороший номер можно получить из особенного дополнением нулей слева к обоим числам.
# Пример: 17\234 => 0017\00234 
# Напишите функцию, которая принимает на вход строку и для каждого особенного номера,
# встречающегося в строке, выводит соответствующий хороший номер.

import re

def to_good_numbers(special_numbers):
    parts = special_numbers.split('\\')
    left_part = parts[0].zfill(4)
    right_part = parts[1].zfill(5)
    return f"{left_part}\\{right_part}"

def to_string(input_string):
    pattern = re.compile(r'\b(\d{2, 4}\\\d{2, 5})\b')
    matches = pattern.findall(input_string)
    result = input_string
    for match in matches:
        good_number = to_good_numbers(match)
        result = result.replace(match, good_number)
    return result

input_string = input()
output_string = to_string(input_string)
print(output_string)
    
# Для решения задачи использовал:
# https://docs.python.org/3/library/re.html (re)
# https://www.w3schools.com/python/python_for_loops.asp (for x in y)
# https://www.w3schools.com/python/ref_string_zfill.asp (zfill)
