#!/usr/bin/python

import imaplib
obj = imaplib.IMAP4_SSL('imap.yandex.ru',993)
obj.login('Anton2017Akulov@yandex.ru','ganktqfunceetkrc')
obj.select()
number = len(obj.search(None, 'UnSeen')[1][0].split())
if number>0:
    print(number)
else:
    print('')
