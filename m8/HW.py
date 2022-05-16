# 1. Write easy program, which will display current date and time.

# from datetime import datetime
# curr_date_time = datetime.today()
# print(f"Current date and time: {curr_date_time}")

# 2. Write python program, which will accept comma-separated numbers, and then it should write tuple and list of them
# default numbers in the task: 1, 2, 7, 43, 9

# user_input = input('Enter numbers separated by commas\n')
# tuple_creation = eval(user_input)
# print(f'This is a tuple: {tuple_creation}, type is {type(tuple_creation)}')
# list_from_tuple = list(tuple_creation)
# print(f'This is a list: {list_from_tuple}, type is {type(list_from_tuple)}')

# 3. Write python program, which will ask file name. File should be read, and only even lines should be shown.
# filename: epamofficesfile.txt

# file_input = input("Enter the filename (default is epamofficesfile.txt)\n")
# file_open = open(file_input, "r", encoding="utf8")
# line_num = 0
#
# for line in file_open.readlines():
#     line_num += 1
#     if line_num % 2 == 0:
#         print(line)
# file_open.close()

# 4 Write python program, which should read html document, parse it, and show it’s title.
# WelcometoPythonorg.html

# htmlfile = open("WelcometoPythonorg.html", "r", encoding="utf8")
# titlestr = '<title>'
# for line in htmlfile:
#     if titlestr in line:
#        new_line = line.replace("<title>", '')
#        new_line = new_line.replace("</title>", '')
#        print(new_line)
# htmlfile.close()

#4 Variant 2

# from lxml.html import parse
# htmlfile = open("WelcometoPythonorg.html", "r", encoding="utf8")
# parsefile = parse(htmlfile)
# print(parsefile.find(".//title").text)


# 5. Write python program, which will parse user’s text, and replace some emotions with emoji’s (Look: pip install emoji)

# import emoji
# user_input2 = input("Please enter a text\n")
# print(emoji.emojize(user_input2.replace('cool', ':thumbs_up:')))

#5 Variant2

# import emoji
# emojilist = {'cool': ':thumbs_up:', 'love': ':beating_heart:', 'search': ':magnifying_glass_tilted_left:', 'mango': '	:mango:'}
# def replace_emoji(text, dic):
#     for x, y in dic.items():
#         text = text.replace(x, y)
#     return text
# user_input2 = ''
# while user_input2 != 'exit':
#     user_input2 = input("Please enter a text; Type 'exit' to exit the programm.\n")
#     output = replace_emoji(user_input2, emojilist)
#     print(emoji.emojize(output))

#6  Write program, that will show basic PC information (OS, RAM amount, HDD’s, and etc.)
import wmi

computer = wmi.WMI()
computer_info = computer.Win32_ComputerSystem()[0]
os_info = computer.Win32_OperatingSystem()[0]
proc_info = computer.Win32_Processor()[0]
gpu_info = computer.Win32_VideoController()[0]

os_name = os_info.Name.encode('utf-8').split(b'|')[0]
os_version = ' '.join([os_info.Version, os_info.BuildNumber])
system_ram = float(os_info.TotalVisibleMemorySize) / 1048576  # KB to GB

print('OS Name: {0}'.format(os_name))
print('OS Version: {0}'.format(os_version))
print('CPU: {0}'.format(proc_info.Name))
print('RAM: {0} GB'.format(system_ram))
print('Graphics Card: {0}'.format(gpu_info.Name))