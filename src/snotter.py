import sys
import requests

URL = 'https://dnsdumpster.com'

client = requests.session()
client.get(URL)
target='pbm.medicaidmontana.com'
print(client.cookies)

'''
# Retrieve the CSRF token first
client.get(URL)  # sets cookie
if 'csrftoken' in client.cookies:
    # Django 1.6 and up
    csrftoken = client.cookies['csrftoken']
else:
    # older versions
    csrftoken = client.cookies['csrf']

data = dict(targetip=target,  csrfmiddlewaretoken=csrftoken,)
r = client.post(URL, data=login_data, headers=dict(Referer=URL))
'''

#Accept-Language: en-US,en;q=0.9
#Cookie: csrftoken=yv91mFDAtvPl2RZwqpIVlKEHSiHTyUrRQe665bk8MzwRvn9Dzxousi8y22xUdhxu; _ga=GA1.2.1598311677.1614916960; _gid=GA1.2.516827477.1614916960; _gat=1
#csrfmiddlewaretoken=TvKWTi4OiYQLpuk4WzgtU4mymKcBOS8AbeH1COLmB2xhS0ub5HW21CQpwu2Ctfed&targetip=example.com